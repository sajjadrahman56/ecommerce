import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key 
  });
   // final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withOpacity(0.2),
          child:const  Padding(
            padding:  EdgeInsets.all(20.0),
            child:  Icon(Icons.computer,size: 32,color: AppColors.primaryColor,),
          ),
          
        ),
          Text('Electronics',style: TextStyle(fontSize: 16,
        color: AppColors.primaryColor , fontWeight: FontWeight.w600),),
      ],
    );
  }
}
