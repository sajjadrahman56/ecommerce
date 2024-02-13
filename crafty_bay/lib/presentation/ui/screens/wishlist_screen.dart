import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../../state_holders/wish_list_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}
class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WishListController>().getWishList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: appBar,
        body: GetBuilder<WishListController>(builder: (controller) {
          if (controller.inProgress) {
            return const CenterCircularProgressIndication();
          }
          return Visibility(
            visible: controller.wishListModel.wishItemList?.isNotEmpty ?? false,
            replacement: const Center(
              child: Text('Empty Wish List'),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 4),
              child: GridView.builder(
                itemCount: controller.wishListModel.wishItemList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: ProductCard(
                      productModel: controller
                          .wishListModel.wishItemList![index].product!,
                      addToWishList: false,
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.find<MainBottomNavController>().backToHome();
        },
      ),
      title: const Text('Wish List'),
    );
  }
}
