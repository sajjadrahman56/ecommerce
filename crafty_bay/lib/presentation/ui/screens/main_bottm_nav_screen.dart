
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/carts_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
 

  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const CategoriesScreen(),
    const CartsScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
        
          body: _screens[controller.currentIndex] ,
          
           bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: controller.currentIndex,
            onTap: (index){
              controller.changeIndex(index);
            },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                 
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Carts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'wishlist',
                ),
              ],
            
           ),
        );
      }
    );
  }
}