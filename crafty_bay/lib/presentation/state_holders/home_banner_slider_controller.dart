import 'package:crafty_bay/data/models/home_banner_list_model.dart';
import 'package:get/get.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';
class HomeBannerSliderController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  HomeBannerListModel _homeBannerListModel = HomeBannerListModel();

  HomeBannerListModel get homeBannerListModel => _homeBannerListModel;

  Future<bool> getHomeBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBannerSlider);
    _inProgress = false;
    if (response.isSuccess) {
      _homeBannerListModel =
          HomeBannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
