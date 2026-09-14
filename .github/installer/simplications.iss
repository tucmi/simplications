#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif

[Setup]
AppId={{A6A0A6E8-3FCF-4D4D-9E2B-8E9C08EC8D56}
AppName=Simplications
AppVersion={#AppVersion}
AppPublisher=Simplications
DefaultDirName={autopf}\Simplications
DefaultGroupName=Simplications
UninstallDisplayIcon={app}\simplications.exe
OutputDir=build
OutputBaseFilename=simplications-{#AppVersion}-windows-setup
Compression=lzma
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=admin
DisableProgramGroupPage=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional icons:"

[Files]
Source: "build\\windows\\x64\\runner\\Release\\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{autoprograms}\Simplications"; Filename: "{app}\simplications.exe"
Name: "{autodesktop}\Simplications"; Filename: "{app}\simplications.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\simplications.exe"; Description: "Launch Simplications"; Flags: nowait postinstall skipifsilent
