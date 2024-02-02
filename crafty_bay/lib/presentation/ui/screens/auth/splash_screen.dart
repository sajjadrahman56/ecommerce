 
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_bottm_nav_screen.dart';
import 'verify_eamil_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    final  bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if(isLoggedIn){
      Get.offAll( const MainBottomNavScreen());
    }else{
Get.offAll(const VerifyEmailScreen());
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child:   Column(
        children: [
          Spacer(),
          AppLogo(),
          Spacer(),
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text('version 1.6.1'),
          SizedBox(
            height: 8,
          ),
        ],
      )),
    );
  }
}
