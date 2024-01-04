
import 'package:crafty_bay/presentation/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child:  Column(
          children:   [
            const Spacer(),
            
            Image.asset(AssetsPath.logo,width: 120,),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 8,),
            const Text('version 1.6.1'),
             const SizedBox(height: 8,),

          ],
        )
      ),
    );
  }
}