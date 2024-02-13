import 'dart:developer';
import 'package:crafty_bay/data/models/wish_list_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  WishListModel _wishListModel = WishListModel();

  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.wishList);
    log(AuthController.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
