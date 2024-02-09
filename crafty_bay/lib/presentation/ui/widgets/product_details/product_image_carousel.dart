import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key, this.height, required this.urls,
  });

  final double? height;
  final List<String> urls;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
          ),
          items: widget.urls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                      image: DecorationImage(image: NetworkImage(url)),
                    ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.urls.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: i == index ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color: i == index ? AppColors.primaryColor : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}

// import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class ProductImageCarousel extends StatefulWidget {
//   const ProductImageCarousel({
//     super.key,
//     this.height, required List<String> urls,
//   });

//   final double? height;

//   @override
//   State<ProductImageCarousel> createState() => _ProductImageCarouselState();
// }

// class _ProductImageCarouselState extends State<ProductImageCarousel> {
//   ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CarouselSlider(
//           options: CarouselOptions(
//             height: widget.height ?? 220.0,
//             onPageChanged: (index, reason) {
//               _currentIndex.value = index;
//             },
//             viewportFraction: 1.0,
//             autoPlay: true,
//           ),
//           items: [1, 2, 3, 4, 5].map((i) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 1.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       'text $i',
//                       style: TextStyle(fontSize: 16.0),
//                     ));
//               },
//             );
//           }).toList(),
//         ),
//         Positioned(
//           bottom: 10,
//           left: 0,right: 0,
//           child: ValueListenableBuilder(
//               valueListenable: _currentIndex,
//               builder: (context, index, _) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     for (int i = 0; i < 5; i++)
//                       Container(
//                         width: 14,
//                         height: 14,
//                         margin: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                             color: i == index
//                                 ? AppColors.primaryColor
//                                 : Colors.white,
//                             border: Border.all(
//                               color: i == index
//                                   ? AppColors.primaryColor
//                                   : Colors.white,
//                             ),
//                             borderRadius: BorderRadius.circular(30)),
//                       )
//                   ],
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }
