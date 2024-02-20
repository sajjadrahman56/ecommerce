import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/auth_controller.dart';
import 'auth/verify_eamil_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  final authController = Get.find<AuthController>();

  late Map<String, dynamic> userData = {
    'name': authController.readProfile?.cusName ??
        authController.completeProfile?.cusName,
    'id': authController.readProfile?.userId ??
        authController.completeProfile?.userId,
    'address': authController.readProfile?.cusAdd ??
        authController.completeProfile?.cusAdd,
    'phone': authController.readProfile?.cusPhone ??
        authController.completeProfile?.cusPhone,
    'shipAdd': authController.readProfile?.shipAdd ??
        authController.completeProfile?.shipAdd,
  };

  late bool response = authController.readProfile != null;
  late bool response2 = authController.completeProfile != null;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Builder(
            builder: (context) {
              if (response == false && response2 == false) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'User data not available?',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'Please login first!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:const  EdgeInsets.all(0)
                          ),
                          onPressed: () {
                            Get.to(() => const VerifyEmailScreen());
                          },
                          child: const Text('LogIn'))
                    ],
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.person_rounded,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          userData['name'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade800),
                        ),
                        Text(
                          "I'D: ${userData['id'].toString()}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(
                      Icons.location_pin,
                      size: 30,
                    ),
                    title: const Text(
                      'Address',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      userData['address'],
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone_rounded,
                      size: 30,
                    ),
                    title: const Text(
                      'Phone',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      userData['phone'],
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.my_location_rounded,
                      size: 30,
                    ),
                    title: const Text(
                      'ShipAdd',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      userData['shipAdd'],
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
