import 'package:crafty_bay/presentation/ui/screens/verify_eamil_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(const VerifyEmailScreen());
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
