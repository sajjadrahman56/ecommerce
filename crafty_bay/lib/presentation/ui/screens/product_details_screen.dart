import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../utility/app_colors.dart';
import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required int productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfitem = ValueNotifier<int>(1);
  List<Color> colors = [
    Colors.pink,
    Colors.black,
    Colors.amber,
    Colors.red,
    Colors.green
  ];

  Color selectedColor = Colors.pink;
  List<String> sized = ['S', 'L', 'M', 'XL', 'XXL', 'XXXL'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [const ProductImageCarousel(), productDetailsBody],
            ),
          )),
          PriceAndAddToCartsSection
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Nike Sport Shoe 2023 Edition ED23R - Save 30%',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: noOfitem,
                  builder: (context, value, _) {
                    return ItemCount(
                      initialValue: value,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        noOfitem.value = v.toInt();
                        print('Selected value: $value');
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ReviewAndRatingRow,
          const SizedBox(
            height: 8,
          ),
          const Text('Color',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          ColorSelector(
            colors: colors,
            onChanged: (onSelectColor) {
              selectedColor = onSelectColor;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Size',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          SizedBox(
            height: 8,
          ),
          SizeSelector(
            sizes: sized,
            onChangedSize: (s) {},
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          SizedBox(
            height: 8,
          ),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    );
  }

  Row get ReviewAndRatingRow {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '4.4',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Reviews',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: AppColors.primaryColor,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.favorite_outline_rounded,
                  size: 18, color: Colors.white),
            ))
      ],
    );
  }

  Container get PriceAndAddToCartsSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price : ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
              Text(
                '100000',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Add to Cart')),
          )
        ],
      ),
    );
  }
}
