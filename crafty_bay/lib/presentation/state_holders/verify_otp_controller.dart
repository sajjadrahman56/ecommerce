import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

import '../../data/service/network_caller.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';

  String get token => _token;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(_token);
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileCompleted == false;
        if (_shouldNavigateCompleteProfile == false) {
          Get.find<AuthController>().saveUserDetails(
              _token, Get.find<ReadProfileDataController>().readProfile,null);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
