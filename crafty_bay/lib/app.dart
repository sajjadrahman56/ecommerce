import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/ui/utility/app_colors.dart';
 

class CraftyBuy extends StatelessWidget {
  const CraftyBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      theme: ThemeData(
        primarySwatch:MaterialColor(
           AppColors.primaryColor.value,
           AppColors.colorSwatch
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,

            )
          ),
          
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,

            )
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,

            )
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,

            )
          ),

          

        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
               backgroundColor:  AppColors.primaryColor,
               padding: const EdgeInsets.symmetric(vertical: 14),
               textStyle: const TextStyle(
                 fontSize: 14,
                 letterSpacing: 0.5
               ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              foregroundColor: Colors.white
            ),
          ),
        textButtonTheme: TextButtonThemeData(
             style: TextButton.styleFrom(
               
              foregroundColor: AppColors.primaryColor,
             ),
          ),

        textTheme:   TextTheme(
          titleLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600
          ),
        )
        
      ) ,
      home:const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}




