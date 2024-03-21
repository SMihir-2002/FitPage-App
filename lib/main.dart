import 'package:fitpage/constants/app_colors.dart';
import 'package:fitpage/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.primaryBgColor,
      appBarTheme: AppBarTheme(color: AppColors.primaryBgColor, iconTheme: const IconThemeData(color: Colors.white) )
      ),
      home: const HomeScreen(),
    );
  }
}


