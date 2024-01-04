import 'package:crafty_bay/presentation/ui/widgets/app_log.dart';
import 'package:flutter/material.dart';

import '../utility/asset_path.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
              'Welcome Back',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Please Enter your email address',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            ElevatedButton(onPressed: (){},
             child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
