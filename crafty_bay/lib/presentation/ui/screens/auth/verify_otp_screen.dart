import 'dart:async';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/circular_progress_indicator.dart';
import '../main_bottm_nav_screen.dart';

class VerifyOtpScreen extends StatefulWidget {

  const VerifyOtpScreen({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late Timer _timer;

  int seconds = 120;
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
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
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    
                    _timer.cancel(); // reset the timer when OTP is completed
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<VerifyOTPController>(
                    builder: (verifyOtpController) {
                      return Visibility(
                        visible: verifyOtpController.inProgress==false,
                        replacement: const CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final bool response = await verifyOtpController.verifyOTP(
                                  widget.email, _otpTEController.text);
                              if (response) {
                                if (verifyOtpController.shouldNavigateCompleteProfile) {
                                  Get.to(() =>   CompleteProfileScreen());
                                } else {
                                  Get.offAll(() => const MainBottomNavScreen());
                                }
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'hihi',
                                  message: verifyOtpController.errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                ));
                              }
                            }
                          },
                          child: const Text('Next'),
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'This code will expire in ',
                      ),
                      TextSpan(
                        text: '$seconds s',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Reset the timer and update seconds when Resend Code is pressed
                      seconds = 120;
                    });
                    _startTimer();
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
