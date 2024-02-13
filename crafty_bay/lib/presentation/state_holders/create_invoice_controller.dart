import 'dart:developer';
import 'package:crafty_bay/data/models/payment_method_list.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  PaymentMethodList _paymentMethodList = PaymentMethodList();

  PaymentMethodList get paymentMethodList => _paymentMethodList;

  Future<bool> createInvoice() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.invoiceCreate);
    log(AuthController.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _paymentMethodList = PaymentMethodList.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

}
