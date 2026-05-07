import 'package:flutter/material.dart';
import 'package:video_tape_store/Pages/Auth/LoginPage.dart';
import 'package:video_tape_store/Pages/Utils/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SeNless SoNe zero',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor, 
          surface: AppColors.surfaceColor,
        ),
        cardTheme: const CardTheme(
          color: AppColors.cardColor,
        ),
      ),
      home: const LoginPage(),
    );
  }
}