import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

import '../../data/service/network_caller.dart';
 
class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String _token = '';

  String get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage!;
      update();
      return false;
    }
  }
}

// class VerifyOTPController extends GetxController {
//   bool _inProgress = false;

//   bool get inProgress => _inProgress;

//   String _errorMessage = '';

//   String get errorMessage => _errorMessage;

//   bool _shouldNavigateCompleteProfile = true;

//   bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

//   String _token = '';

//   String get token => _token;

//   Future<bool> verifyOTP(String email, String otp) async {
//     _inProgress = true;
//     update();
//     final response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
//     _inProgress = false;
//     if (response.isSuccess) {
//       _token = response.responseData['data'];
//       await Future.delayed(const Duration(seconds: 3));
//       final result =
//           await Get.find<ReadProfileDataController>().readProfileData(token);
//       if (result) {
//         _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
//         if (_shouldNavigateCompleteProfile == false) {
//           await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
//         }
//       } else {
//         _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
//         update();
//         return false;
//       }
//       update();
//       return true;
//     } else {
//       _errorMessage = response.errorMessage!;
//       update();
//       return false;
//     }
//   }
// }

// import 'dart:developer';

// import 'package:crafty_bay/data/service/network_caller.dart';
// import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

 
// import '../../data/utility/urls.dart';

// class VerifyOtpController extends GetxController{
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;

//    String _errorMessage = '';
//    String get errorMessage => _errorMessage;

//   bool _shouldNavigateCompleteProfile = false;
//   bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  
//   Future<bool> verifyOtp(String email, String otp) async {
//     _inProgress = true;
//     update();
//     final  response = await NetworkCaller().getRequest(
//     Urls.verifyOtp(email,otp));
//     _inProgress = false;

//     if (response.isSuccess) {
//       final token = response.responseData['data']; 
//       await Future.delayed(const Duration(seconds: 5));
//       final result = await Get.find<ReadProfileDataController>().readProfileData(token);
//       if(result){
//         _shouldNavigateCompleteProfile = Get.find<ReadProfileDataController>().isProfileCompleted == false;
       
//       }else{
//          _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
//          log('iside-----------------------------$errorMessage');
//          update();
//          return false;
//       }
//       update();
//       return true;
//     } else {
//       _errorMessage = response.errorMessage!;
//       update();
//       return false;
//     }
//   }
// }