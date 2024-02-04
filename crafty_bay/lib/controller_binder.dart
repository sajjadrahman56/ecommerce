
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controler.dart';
import 'package:crafty_bay/presentation/state_holders/send_email_opt_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/auth_controller.dart';
import 'presentation/state_holders/category_controller.dart';
import 'presentation/state_holders/home_banner_controller.dart';
import 'presentation/state_holders/main_bottom_nav_controller.dart';
import 'presentation/state_holders/read_profile_data_controller.dart';
import 'presentation/state_holders/verify_otp_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
  }
}