import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/learning/home_screen.dart';

void main() {
  runApp(const CVATrainingApp());
}

class CVATrainingApp extends StatelessWidget {
  const CVATrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CVA Training',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
