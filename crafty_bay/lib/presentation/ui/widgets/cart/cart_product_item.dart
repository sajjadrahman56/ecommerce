 import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/asset_path.dart';

class CardProductItem extends StatefulWidget {
  const CardProductItem({super.key});

  @override
  State<CardProductItem> createState() => _CardProductItemState();
}

class _CardProductItemState extends State<CardProductItem> {
  ValueNotifier<int> noOfitem = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dumyShoeImageJpg,
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: 
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:
                      
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nike shoe 12ksm 2021 edition ' ,
                          maxLines: 2,
                           style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16),),
                          
                          Row(
                            children: [
                              Text('Color: Red'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Size: X'),
                            ],
                          )
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete,
                    color: Colors.grey
                    ,))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$1000',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                          fontSize: 16),
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
              ],
            ),
          
          )
        ],
      ),
    );
  }
}
