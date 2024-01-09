import 'package:flutter/material.dart';

import '../../utill/dimensions.dart';

class CustomDotIndicator extends StatelessWidget {

  final List<dynamic> myList;
  final int currentIndex;

  CustomDotIndicator({required this.myList, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
        myList.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: currentIndex == index ? 15 : 6.0,
          height: currentIndex == index ? 5 : 5,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
            shape: BoxShape.rectangle,
            color: currentIndex == index ? Colors.redAccent : Colors.redAccent.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
