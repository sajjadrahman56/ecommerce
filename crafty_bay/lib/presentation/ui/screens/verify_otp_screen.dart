import 'package:crafty_bay/presentation/ui/widgets/app_log.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const AppLogo(height: 80),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Enter OTP CODE',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Enter OTP Screen',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
             
            const SizedBox(height: 24,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){},
               child: const Text('Next')),
            )
          ],
        ),
      ),
    );
  }
}
