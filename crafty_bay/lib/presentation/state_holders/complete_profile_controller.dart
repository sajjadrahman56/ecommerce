import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/models/creat_profiles_params.dart';
import '../../data/service/network_caller.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> createProfileData(
      String token, CreateProfileParams params) async {
    print('\n\n\n\createProfileData $token inside---------------------');
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, body: params.toJson(), token: token,);
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage!;

      if (!response.isSuccess) {
        if (response.statusCode == 401) {
          print('-------- sajjad send Unauthorized error. Check token sajvalidity.');
        }
        _errorMessage = response.errorMessage!;
        print('API Error: ${response.errorMessage}'); // Log the error details
        update();
        return false;
      }

      update();
      return false;
    }
  }
}
