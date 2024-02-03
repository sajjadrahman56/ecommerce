import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';
import '../../data/models/response_data.dart';
import '../../data/service/network_caller.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> sendEmailOtp(String email) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendOtpEmail(email));
    _inProgress = false;

    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
