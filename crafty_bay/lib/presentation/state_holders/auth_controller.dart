import 'dart:convert';
import 'package:crafty_bay/data/models/complete_profile_model.dart';
import 'package:crafty_bay/data/models/read_profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/screens/auth/verify_eamil_screen.dart';

class AuthController extends GetxController {
  static String? token;
  ReadProfileModel? readProfile;
  CompleteProfileModel? completeProfile;

  Future<void> saveUserDetails(
      String t, ReadProfileModel? r, CompleteProfileModel? p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('readProfile', jsonEncode(r?.toJson()));
    await sharedPreferences.setString(
        'completeProfile', jsonEncode(p?.toJson()));
    token = t;
    readProfile = r;
    completeProfile = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    readProfile = await _getReadProfile();
    completeProfile = await _getCompleteProfile();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<ReadProfileModel?> _getReadProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? rdStrProfile = sharedPreferences.getString('readProfile');
    final bool result = rdStrProfile.toString() == null.toString();
    if (result) {
      return null;
    } else {
      return ReadProfileModel.fromJson(jsonDecode(rdStrProfile!));
    }
  }

  Future<CompleteProfileModel?> _getCompleteProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? cmStrProfile = sharedPreferences.getString('completeProfile');
    final bool result = cmStrProfile.toString() == null.toString();
    if (result) {
      return null;
    } else {
      return CompleteProfileModel.fromJson(jsonDecode(cmStrProfile!));
    }
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    token = null;
  }

  static Future<void> goToLogin() async {
    Get.to(() => const VerifyEmailScreen());
  }
}
