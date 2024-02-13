import 'package:crafty_bay/presentation/ui/screens/carts_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/brand_list_controller.dart';
import '../../state_holders/category_list_controller.dart';
import '../../state_holders/home_banner_slider_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_list_controller.dart';
import '../../state_holders/popular_product_list_controller.dart';
import '../../state_holders/special_product_list_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishlistScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeBannerSliderController>().getHomeBannerList();
      Get.find<CategoryListController>().getCategoryList();
      Get.find<BrandListController>().getBrandList();
      Get.find<PopularProductListController>().getPopularProductList();
      Get.find<SpecialProductListController>().getSpecialProductList();
      Get.find<NewProductListController>().getNewProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screen[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Carts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Wishlist"),
          ],
        ),
      );
    });
  }
}
