import 'package:crafty_bay/data/models/brand_data.dart';
import 'package:crafty_bay/data/models/category_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_list_screen.dart';
import '../utility/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  const CategoryBrandItem({
    super.key,
    this.categoryData,
    this.brandData,
  });

  final CategoryData? categoryData;
  final BrandData? brandData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          title: categoryData?.categoryName ?? brandData?.brandName ?? '',
          id: categoryData?.id ?? brandData?.id,
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.network(
                  categoryData?.categoryImg ?? brandData?.brandImg ?? '',
                  width: 50,
                  height: 50,
                )),
          ),
          Text(
            categoryData?.categoryName ?? brandData?.brandName ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
