import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/home_banner_data.dart';
import '../../screens/product_details_screen.dart';
import '../../utility/app_colors.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    this.height,
    required this.bannerData,
  });

  final List<BannerData> bannerData;

  final double? height;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 180.0,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              }),
          items: widget.bannerData.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          banner.image ?? '',
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: SizedBox(
                          height: 180,
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                banner.title ?? '',
                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade800,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                banner.shortDes ?? '',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade800,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {
                                      if (banner.productId != null) {
                                        Get.to(() => ProductDetailsScreen(
                                            productId: banner.productId!));
                                      } else {}
                                    },
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    child: const Text(
                                      'See More', // Changed this line
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerData.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: i == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color:
                              i == index ? AppColors.primaryColor : Colors.grey,
                        )),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
