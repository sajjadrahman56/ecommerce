import 'package:crafty_bay/data/models/complete_profile_model.dart';
import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  CompleteProfileModel _completeProfile = CompleteProfileModel();

  CompleteProfileModel get completeProfile => _completeProfile;

  Future<bool> createProfileData(
      String token, CreateProfileParams createProfileParams) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.createProfile,
        token: token, body: createProfileParams.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _completeProfile = CompleteProfileModel.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token,null, _completeProfile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
