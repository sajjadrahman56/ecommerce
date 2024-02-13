import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../state_holders/brand_list_controller.dart';
import '../widgets/category_brand_item.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: GetBuilder<BrandListController>(builder: (controller) {
          return Visibility(
            visible: controller.inProgress == false,
            replacement: const CenterCircularProgressIndication(),
            child: GridView.builder(
              itemCount: controller.brandListModel.brandDataList?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  child: CategoryBrandItem(
                    brandData: controller.brandListModel.brandDataList![index],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Brand'),
    );
  }
}
