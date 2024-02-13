import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/review_list_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';
import 'auth_controller.dart';

class ReviewListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ReviewListModel _reviewListModel = ReviewListModel();

  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> getReviewList(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.listReviewByProduct(productId));
    log(AuthController.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

  int get totalReviews {
    int total = 0;
    int length = _reviewListModel.reviewList?.length ?? 0;
    log(length.toString());
    for (int i = 1; i <= length; i++) {
      total++;
    }
    log(total.toString());
    return total;
  }
}
