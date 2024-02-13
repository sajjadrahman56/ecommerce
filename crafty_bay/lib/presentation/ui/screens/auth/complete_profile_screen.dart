import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import '../../../../data/models/create_profile_params.dart';
 
import '../../widgets/app_logo.dart';
 
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';

import '../main_bottom_nav_screen.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});
  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _stateTEController = TextEditingController();
  final TextEditingController _postCodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _faxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddressTEController =
      TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostCodeTEController =
      TextEditingController();
  final TextEditingController _shipCountryTEController =
      TextEditingController();
  final TextEditingController _shipPhoneTEController = TextEditingController();
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
                const SizedBox(height: 80),
                const AppLogo(height: 100),
                const SizedBox(height: 10),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter full Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 2,
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _cityTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(labelText: 'City'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter City Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _stateTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(labelText: 'State'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter State';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _postCodeTEController,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(labelText: 'Post code'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter post code';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: _countryTEController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(labelText: 'Country'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Mobile', hintText: '01'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter phone number';
                    } else if (RegExp(r"^(?:(?:\+|00)88|01)?\d{11}$")
                        .hasMatch(value)) {
                      return null;
                    }

                    return 'Enter valid 11 digit number';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _faxTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Fax', hintText: '01245'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter fax number';
                    } else if (RegExp(r"^(?:(?:\+|00)88|01)?\d{11}$")
                        .hasMatch(value)) {
                      return null;
                    }

                    return 'Enter valid 11 digit number';
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Shipper Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter shipper Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipAddressTEController,
                  textInputAction: TextInputAction.next,
                  maxLines: 2,
                  decoration:
                      const InputDecoration(labelText: 'Shipping Address'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter Shipping Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _shipCityTEController,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(labelText: 'Ship city'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter ship city name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        controller: _shipStateTEController,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(labelText: 'Ship state'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter ship state';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _shipPostCodeTEController,
                        textInputAction: TextInputAction.next,
                        decoration:
                            const InputDecoration(labelText: 'Ship postcode'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter ship postcode';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: _shipCountryTEController,
                        textInputAction: TextInputAction.done,
                        decoration:
                            const InputDecoration(labelText: 'Ship country'),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Enter country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipPhoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'ship phone', hintText: '01'),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter ship phone number';
                    } else if (RegExp(r"^(?:(?:\+|00)88|01)?\d{11}$")
                        .hasMatch(value)) {
                      return null;
                    }

                    return 'Enter valid 11 digit number';
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<CompleteProfileController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndication(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final createProfileParams = CreateProfileParams(
                              cusName: _nameTEController.text.trim(),
                              cusAdd: _addressTEController.text.trim(),
                              cusCity: _cityTEController.text.trim(),
                              cusState: _stateTEController.text.trim(),
                              cusPostcode: _postCodeTEController.text.trim(),
                              cusCountry: _countryTEController.text.trim(),
                              cusPhone: _phoneTEController.text.trim(),
                              cusFax: _faxTEController.text.trim(),
                              shipName: _shipNameTEController.text.trim(),
                              shipAdd: _shipAddressTEController.text.trim(),
                              shipCity: _shipCityTEController.text.trim(),
                              shipState: _shipStateTEController.text.trim(),
                              shipPostcode:
                                  _shipPostCodeTEController.text.trim(),
                              shipCountry: _shipCountryTEController.text.trim(),
                              shipPhone: _shipPhoneTEController.text.trim(),
                            );
                            final bool result =
                                await controller.createProfileData(
                                    Get.find<VerifyOtpController>().token,
                                    createProfileParams);
                            if (result) {
                              Get.offAll(() => const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                                title: 'Complete Profile Failed',
                                message: controller.errorMessage,
                                backgroundColor: Colors.red,
                              ));
                            }
                          }
                        },
                        child: const Text('Complete'),
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
    _nameTEController.clear();
    _addressTEController.clear();
    _cityTEController.clear();
    _stateTEController.clear();
    _postCodeTEController.clear();
    _countryTEController.clear();
    _phoneTEController.clear();
    _faxTEController.clear();
    _shipNameTEController.clear();
    _shipAddressTEController.clear();
    _shipCityTEController.clear();
    _shipStateTEController.clear();
    _shipPostCodeTEController.clear();
    _shipCountryTEController.clear();
    _shipPhoneTEController.clear();

    super.dispose();
  }
}

