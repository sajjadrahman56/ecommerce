import 'package:crafty_bay/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'presentation/ui/utility/app_colors.dart';

class CraftyBuy extends StatelessWidget {
  const CraftyBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        primarySwatch:MaterialColor(
           AppColors.primaryColor.value,
           AppColors.colorSwatch
        ),
      ) ,
      home:const SplashScreen(),
    );
  }
}