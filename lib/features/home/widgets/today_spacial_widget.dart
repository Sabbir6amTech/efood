import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/widgets/custom_dot_indicator.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class TodaySpacialWidget extends StatefulWidget {
  final List<String> images;
  final List<String> images2;
  const TodaySpacialWidget({required this.images, required this.images2});

  @override
  State<TodaySpacialWidget> createState() => _TodaySpacialWidgetState();
}

class _TodaySpacialWidgetState extends State<TodaySpacialWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.paddingSizeLarge,
            bottom: Dimensions.paddingSizeSmall,
            top: Dimensions.paddingSizeExtraLarge),
        child: Text(
          getTranslated('today_special', context)!,
          style: rubikMedium,
        ),
      ),
      // carousel slider image start----------------------------------
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.4,
                child: AbsorbPointer(
                  absorbing: true,
                  child: CarouselSlider(
                    items: widget.images.map((image) {
                      return Builder(
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: FittedBox(
                              child: Image.asset(
                                image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 3),
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        disableCenter: true,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.28,
                child: AbsorbPointer(
                  absorbing: true,
                  child: CarouselSlider(
                    items: widget.images2.map((image) {
                      return Builder(
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlayInterval: const Duration(seconds: 3),
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        disableCenter: true,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        initialPage: 0,
                        viewportFraction: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeSmall,
        ),
        child: CustomDotIndicator(
          myList: widget.images,
          currentIndex: _currentIndex,
        ),
      ),
      const SizedBox(height: Dimensions.paddingSizeLarge),
    ]);
  }
}
