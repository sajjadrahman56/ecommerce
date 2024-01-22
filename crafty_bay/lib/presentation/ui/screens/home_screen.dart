import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/asset_path.dart';
import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../widgets/home/circle_Icon_button_widget.dart';
import '../widgets/home/banner_image_carousel.dart';
import '../widgets/home/section_title.dart';

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
            const BannerCarousel(),
            const SizedBox(
              height: 16,
            ),
            SectionTitle(
              title: 'All Categories',
              onTapSeeAll: () {},              
            ),
            categoryList,
            SectionTitle(
              title: 'Popular',
              onTapSeeAll: () {},              
            ),
            popularProductList,
          ],
        ),
      )),
    );
  }

  TextFormField  get searchTextField {
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

  SizedBox get categoryList {
     return SizedBox(
      height: 130,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return const CategoryItem();
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
  SizedBox get popularProductList {
     return SizedBox(
      height: 300,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            child: Column(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                
                ),
              child: Image.asset(AssetsPath.dumyShoeImageJpg,width: 120,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nike shoe 120',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45
                      
                      ),)
                      ,
                      Row(
                        children: [
                          Text('\$120',style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color:AppColors.primaryColor
                          ),),

                          Wrap(
                           crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star,size: 
                              14,),
                              Text('4.4',style:TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                               
                              ),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
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
          onTap: () {},
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
 
