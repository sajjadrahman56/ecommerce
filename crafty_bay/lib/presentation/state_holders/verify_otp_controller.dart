
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/models/response_data.dart';
import '../../data/models/response_data.dart';
import '../../data/utility/urls.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

   String _errorMessage = '';
   String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  
  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();
    final  response = await NetworkCaller().getRequest(
    Urls.verifyOtp(email,otp));
    _inProgress = false;

    if (response.isSuccess) {
      final token = response.responseData['data']; 

      update();
      return true;
    } else {
      _errorMessage = response.errorMessage!;
      update();
      return false;
    }
  }
}