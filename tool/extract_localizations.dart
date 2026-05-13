import 'dart:convert';
import 'dart:io';

class _Parser {
  _Parser(this.input, this.index);

  final String input;
  int index;

  bool get isEof => index >= input.length;

  void _skipWhitespace() {
    while (!isEof) {
      if (index + 1 < input.length &&
          input[index] == '/' &&
          input[index + 1] == '/') {
        index += 2;
        while (!isEof && input[index] != '\n') {
          index++;
        }
        continue;
      }
      if (index + 1 < input.length &&
          input[index] == '/' &&
          input[index + 1] == '*') {
        index += 2;
        while (index + 1 < input.length &&
            !(input[index] == '*' && input[index + 1] == '/')) {
          index++;
        }
        if (index + 1 < input.length) {
          index += 2;
        }
        continue;
      }
      final c = input.codeUnitAt(index);
      if (c == 32 || c == 9 || c == 10 || c == 13) {
        index++;
        continue;
      }
      break;
    }
  }

  void _expectChar(String ch) {
    _skipWhitespace();
    if (isEof || input[index] != ch) {
      throw StateError('Expected "$ch" at index $index');
    }
    index++;
  }

  bool _tryConsumeChar(String ch) {
    _skipWhitespace();
    if (!isEof && input[index] == ch) {
      index++;
      return true;
    }
    return false;
  }

  String _parseStringLiteral() {
    _skipWhitespace();
    if (isEof || (input[index] != "'" && input[index] != '"')) {
      throw StateError('Expected string literal at index $index');
    }
    final quote = input[index];
    index++;

    final buffer = StringBuffer();
    while (!isEof) {
      final ch = input[index++];
      if (ch == quote) {
        return buffer.toString();
      }
      if (ch == r'\') {
        if (isEof) {
          throw StateError('Invalid escape at EOF');
        }
        final esc = input[index++];
        switch (esc) {
          case 'n':
            buffer.write('\n');
            break;
          case 'r':
            buffer.write('\r');
            break;
          case 't':
            buffer.write('\t');
            break;
          case "'":
            buffer.write("'");
            break;
          case '"':
            buffer.write('"');
            break;
          case r'\':
            buffer.write(r'\');
            break;
          default:
            buffer.write(esc);
            break;
        }
      } else {
        buffer.write(ch);
      }
    }
    throw StateError('Unterminated string literal');
  }

  String _parseConcatenatedString() {
    var value = _parseStringLiteral();
    while (true) {
      _skipWhitespace();
      if (!isEof && (input[index] == "'" || input[index] == '"')) {
        value += _parseStringLiteral();
        continue;
      }
      break;
    }
    return value;
  }

  Map<String, String> _parseInnerMap() {
    final map = <String, String>{};
    _expectChar('{');
    while (true) {
      _skipWhitespace();
      if (_tryConsumeChar('}')) {
        break;
      }
      final key = _parseStringLiteral();
      _expectChar(':');
      final value = _parseConcatenatedString();
      map[key] = value;
      _skipWhitespace();
      _tryConsumeChar(',');
    }
    return map;
  }

  Map<String, Map<String, String>> parseOuterMap() {
    final outer = <String, Map<String, String>>{};
    _expectChar('{');
    while (true) {
      _skipWhitespace();
      if (_tryConsumeChar('}')) {
        break;
      }
      final locale = _parseStringLiteral();
      _expectChar(':');
      final inner = _parseInnerMap();
      outer[locale] = inner;
      _skipWhitespace();
      _tryConsumeChar(',');
    }
    return outer;
  }
}

void main() {
  final source = File('lib/l10n/app_localizations.dart').readAsStringSync();
  const marker =
      'static const Map<String, Map<String, String>> _localizedValues =';
  final markerIndex = source.indexOf(marker);
  if (markerIndex == -1) {
    throw StateError('Could not find _localizedValues marker');
  }

  final mapStart = source.indexOf('{', markerIndex);
  final parser = _Parser(source, mapStart);
  final localizedValues = parser.parseOuterMap();

  final l10nDir = Directory('lib/l10n');
  if (!l10nDir.existsSync()) {
    l10nDir.createSync(recursive: true);
  }

  for (final entry in localizedValues.entries) {
    final map = <String, dynamic>{'@@locale': entry.key};
    map.addAll(entry.value);
    final out = const JsonEncoder.withIndent('  ').convert(map);
    File('lib/l10n/app_${entry.key}.arb').writeAsStringSync('$out\n');
    stdout.writeln('Wrote lib/l10n/app_${entry.key}.arb');
  }

  final buffer = StringBuffer()
    ..writeln("import 'dart:ui';")
    ..writeln()
    ..writeln('class LocalizationLookup {')
    ..writeln("  static Locale _activeLocale = const Locale('de');")
    ..writeln()
    ..writeln('  static void activate(Locale locale) {')
    ..writeln('    _activeLocale = locale;')
    ..writeln('  }')
    ..writeln()
    ..writeln(
      '  static String get activeLanguageCode => _activeLocale.languageCode;',
    )
    ..writeln()
    ..writeln(
      '  static const Map<String, Map<String, String>> valuesByLocale =',
    )
    ..writeln('      <String, Map<String, String>>{');

  final sortedLocales = localizedValues.keys.toList()..sort();
  for (final locale in sortedLocales) {
    buffer.writeln("    '$locale': <String, String>{");
    final sortedKeys = localizedValues[locale]!.keys.toList()..sort();
    for (final key in sortedKeys) {
      final value = localizedValues[locale]![key]!;
      buffer.writeln('      ${jsonEncode(key)}: ${jsonEncode(value)},');
    }
    buffer.writeln('    },');
  }

  buffer
    ..writeln('  };')
    ..writeln()
    ..writeln('  static String translate(')
    ..writeln('    String key, {')
    ..writeln('    String? fallback,')
    ..writeln('    Locale? locale,')
    ..writeln('    Map<String, String>? params,')
    ..writeln('  }) {')
    ..writeln(
      '    final languageCode = (locale ?? _activeLocale).languageCode;',
    )
    ..writeln('    final langMap = valuesByLocale[languageCode];')
    ..writeln("    final enMap = valuesByLocale['en'];")
    ..writeln("    final deMap = valuesByLocale['de'];")
    ..writeln(
      '    var value = langMap?[key] ?? enMap?[key] ?? deMap?[key] ?? fallback ?? key;',
    )
    ..writeln('    if (params != null && params.isNotEmpty) {')
    ..writeln('      for (final entry in params.entries) {')
    ..writeln(
      "        value = value.replaceAll('{' + entry.key + '}', entry.value);",
    )
    ..writeln('      }')
    ..writeln('    }')
    ..writeln('    return value;')
    ..writeln('  }')
    ..writeln()
    ..writeln('  static Map<String, Set<String>> localizationKeysByLocale() {')
    ..writeln('    return {')
    ..writeln('      for (final entry in valuesByLocale.entries)')
    ..writeln('        entry.key: Set<String>.from(entry.value.keys),')
    ..writeln('    };')
    ..writeln('  }')
    ..writeln('}');

  File(
    'lib/l10n/localization_lookup.dart',
  ).writeAsStringSync('${buffer.toString()}\n');
  stdout.writeln('Wrote lib/l10n/localization_lookup.dart');
}
