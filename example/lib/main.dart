import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'src/screens/design_system_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppIntl.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de App UI Kit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: DesignSystemScreen(
        onToggleTheme: _toggleTheme,
        currentMode: _themeMode,
      ),
    );
  }
}
