import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const SimplicationsApp());
}

class SimplicationsApp extends StatelessWidget {
  const SimplicationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Datenschutz-Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
