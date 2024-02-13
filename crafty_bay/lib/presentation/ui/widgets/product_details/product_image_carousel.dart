import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utility/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    this.height,
    required this.imgUrls,
  });

  final double? height;
  final List<String> imgUrls;

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
              height: widget.height ?? 240.0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: widget.imgUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(00),
                    color: Colors.grey.shade400,
                  ),
                  alignment: Alignment.center,
                  child: Image.network(
                    url,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
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
                  for (int i = 0; i < widget.imgUrls.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: i == index
                                ? AppColors.primaryColor
                                : Colors.white,
                          )),
                    )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
