import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/image_data.dart';
import 'package:flutter_restaurant/features/home/demo_bottom_sheet.dart';
import 'package:flutter_restaurant/features/home/widgets/my_local_eat_food_widget.dart';
import 'package:flutter_restaurant/features/home/widgets/local_eats_bootm_sheet.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:intl/intl.dart';

class LocalEatsWidget extends StatefulWidget {
  @override
  State<LocalEatsWidget> createState() => _LocalEatsWidgetState();
}

class _LocalEatsWidgetState extends State<LocalEatsWidget> {
  List<ImageData> foodImages = [
    ImageData(imagePath: Images.cake, title: 'Cake', rating: 4.0, price: 130.0),
    ImageData(
        imagePath: Images.chicken, title: 'fish', rating: 4.0, price: 130.0),
    ImageData(
        imagePath: Images.lunch1, title: 'coffee', rating: 4.0, price: 130.0),
    ImageData(
        imagePath: Images.chinese, title: 'setmenu', rating: 4.0, price: 130.0),
    // Add more ImageData objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTranslated('local_eats', context)!,
                  style: rubikMedium,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(getTranslated('discover_all', context)!))
              ],
            ),
          ),
          SizedBox(
            height: 250, // Adjust the height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: foodImages.map((myFoodImageList) {
                return MyLocalEatFoodWidget(myFoodImageList: myFoodImageList,functionality: openFoodDetailsModal,);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // widget for image showing
   openFoodDetailsModal(ImageData imageData) {
    //int quantity = 1; // Initial quantity

    showModalBottomSheet(
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey.shade200,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: DemoBottomSheet(imageData: imageData),
        );
      },
    );
  }
}
