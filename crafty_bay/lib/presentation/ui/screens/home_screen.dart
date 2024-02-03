import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
 
import 'package:crafty_bay/presentation/ui/screens/auth/verify_eamil_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/category_controller.dart';
import '../../state_holders/home_banner_controller.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item.dart';
import '../widgets/circular_progress_indicator.dart';
import '../widgets/home/circle_Icon_button_widget.dart';
import '../widgets/home/banner_image_carousel.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card_item.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            searchTextField,
            const SizedBox(
              height: 16,
            ),
               SizedBox(
                height: 210,
                child: GetBuilder<HomeBannerController>(
                    builder: (homeBannerController) {
                  return Visibility(
                    visible: homeBannerController.inProgress == false,
                    replacement: const CenterCircularProgressIndicator(),
                    child: BannerCarousel(
                      bannerList:
                          homeBannerController.bannerListModel.bannerList ?? [],
                    ),
                  );
                }),
              ),
            SectionTitle(
              title: 'All Categories',
              onTapSeeAll: () {
                Get.find<MainBottomNavController>().changeIndex(1);
              },
            ),
            categoryList,
            SectionTitle(
              title: 'Popular',
              onTapSeeAll: () {
                Get.to(()=> ProductListScreen());
              },
            ),
            productList,
            const SizedBox(
              height: 8,
            ),
            SectionTitle(
              title: 'Special',
              onTapSeeAll: () {},
            ),
            productList,
            const SizedBox(
              height: 8,
            ),
            SectionTitle(
              title: 'New',
              onTapSeeAll: () {},
            ),
            productList,
          ],
        ),
      )),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }

  // SizedBox get categoryList {
  //   return SizedBox(
  //     height: 130,
  //     child: ListView.separated(
  //       primary: false,
  //       shrinkWrap: true,
  //       itemCount: 10,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return const CategoryItem();
  //       },
  //       separatorBuilder: (_, index) {
  //         return const SizedBox(
  //           width: 8,
  //         );
  //       },
  //     ),
  //   );
  // }
  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: ListView.separated(
              itemCount: categoryController.categoryListModel.categoryList?.length ?? 0,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                    category: categoryController.categoryListModel
                        .categoryList![index]);
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          );
        }
      ),
    );
  }
  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () async {
            await AuthController.clearAuthData();
            Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        )
      ],
    );
  }
}
