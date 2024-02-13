
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/user_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';

import '../../state_holders/auth_controller.dart';
import '../../state_holders/brand_list_controller.dart';
import '../../state_holders/category_list_controller.dart';
import '../../state_holders/home_banner_slider_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/new_product_list_controller.dart';
import '../../state_holders/popular_product_list_controller.dart';
import '../../state_holders/special_product_list_controller.dart';
import '../widgets/category_brand_item.dart';
import '../widgets/home/banner_carousel.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card.dart';

import 'auth/verify_eamil_screen.dart';
import 'brand_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 4),
              searchTextFormField,
              const SizedBox(height: 12),
              SizedBox(
                  height: 202,
                  child: GetBuilder<HomeBannerSliderController>(
                      builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndication(),
                      child: BannerCarousel(
                        bannerData:
                            controller.homeBannerListModel.bannerDataList ?? [],
                      ),
                    );
                  })),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'All Brand',
                onTapSeeAll: () {
                  Get.to(const BrandScreen());
                },
              ),
              brandList,
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<PopularProductListController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<SpecialProductListController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
              const SizedBox(height: 8),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              GetBuilder<NewProductListController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: const CenterCircularProgressIndication(),
                    child: productList(
                        controller.productListModel.productList ?? []),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndication(),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.categoryListModel.categoryDataList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryBrandItem(
                categoryData:
                    controller.categoryListModel.categoryDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get brandList {
    return SizedBox(
      height: 100,
      child: GetBuilder<BrandListController>(builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenterCircularProgressIndication(),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.brandListModel.brandDataList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryBrandItem(
                brandData: controller.brandListModel.brandDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            productModel: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFormField {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade500,
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      elevation: 0,
      title: Image.asset(AssetsPath.logoNav),
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      actions: [
        CircleIconButton(
          onTap: () {
            Get.to(()=>const UserProfileScreen());
          },
          iconData: Icons.person_outline_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return logOutAlertDialog;
                });
          },
          iconData: Icons.logout_rounded,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  AlertDialog get logOutAlertDialog {
    return AlertDialog(
      title: const Text('LogOut'),
      content: const Text('Do you want to logout?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('No')),
        TextButton(
            onPressed: () {
              AuthController.clearAuthData();
              Get.offAll(() => const VerifyEmailScreen());
            },
            child: const Text('Yes')),
      ],
    );
  }
}
