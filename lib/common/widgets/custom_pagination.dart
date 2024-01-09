import 'package:flutter/material.dart';

import '../../utill/dimensions.dart';

class DotSwiperPagination extends StatelessWidget {
  final int activeIndex;
  final int itemCount;
  final Color activeColor;
  final Color color;
  final double size;

  const DotSwiperPagination({
    required this.activeIndex,
    required this.itemCount,
    this.activeColor = Colors.blue,
    this.color = Colors.grey,
    this.size = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == activeIndex ? activeColor : color,
            ),
          ),
        );
      }),
    );
  }
}
