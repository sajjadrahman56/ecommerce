import 'package:crafty_bay/presentation/state_holders/add_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_wishlist_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/brand_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/presentation/state_holders/delete_cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_slider_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/otp_time_decrase.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:crafty_bay/presentation/state_holders/remove_wish_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/review_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_otp_to_email_controller.dart';
import 'package:crafty_bay/presentation/state_holders/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpTimeDecreasCount());
    Get.put(MainBottomNavController());
    Get.put(SendOtpToEmailController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(DeleteCartListController());
    Get.put(AddToWishListController());
    Get.put(WishListController());
    Get.put(RemoveWishListController());
    Get.put(ReviewListController());
    Get.put(AddReviewController());
    Get.put(CreateInvoiceController());
    Get.put(BrandListController());
  }
}
