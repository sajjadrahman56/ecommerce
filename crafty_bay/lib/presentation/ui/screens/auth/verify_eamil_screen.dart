import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../state_holders/send_otp_to_email_controller.dart';
import '../../widgets/app_logo.dart';
import 'verify_otp_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 150),
                const AppLogo(height: 100),
                const SizedBox(height: 10),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTEController,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value!.trim().isEmpty ) {
                      return 'Enter e-mail address';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return null;
                    }
                    return 'invalid e-mail';
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<SendOtpToEmailController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndication(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool result = await controller
                                .sendOtpToEmail(_emailTEController.text.trim());
                            if (result) {
                              Get.to(() => VerifyOtpScreen(
                                    email: _emailTEController.text.trim(),
                                  ));
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                                title: 'Send otp failed',
                                message: controller.errorMessage,
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}


