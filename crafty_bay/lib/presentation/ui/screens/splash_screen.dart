
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Column(
          children: const [
            Spacer(),
            
            Image(image: AssetImage('assets/images/logo.png')),
            Spacer(),
            const Text('version 1.6.10')

          ],
        )
      ),
    );
  }
}