import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/image_data.dart';
import 'package:flutter_restaurant/features/home/widgets/add_ons_checkbox.dart';
import 'package:flutter_restaurant/features/home/widgets/bottam_radio_button.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';

import 'package:flutter_restaurant/utill/styles.dart';
import 'package:intl/intl.dart';

import '../../utill/images.dart';
import 'widgets/bottom_checkbox_widget.dart';

class DemoBottomSheet extends StatelessWidget {
  final ImageData imageData;

  DemoBottomSheet({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageData.imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  // Display food information
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                imageData.title,
                                style: rubikMedium,
                              ),
                              Text('${imageData.rating}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            '${imageData.price}',
                            style: rubikMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    getTranslated('description', context)!,
                    style: rubikRegular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFF5F3),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Row(
                      children: [
                        Image.asset(Images.descriptionleaf),
                        Text(getTranslated('non_veg', context)!)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(getTranslated('dummy_description', context)!),
                )),
            Container(
              width: 350,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getTranslated('size', context)!,
                              style: rubikMedium,
                            ),
                            Text(
                              getTranslated('select_one', context)!,
                              style: TextStyle(
                                  color: Colors.redAccent.withOpacity(1)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0, top: 5),
                        child: Container(
                          width: 60,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              getTranslated('required', context)!,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ModalSheetRadioButton(
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      getTranslated('salad', context)!,
                      style: rubikMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      getTranslated('select_minimum', context)!,
                      style: robotoRegular,
                    ),
                  ),
                  // here i want to use this widget
                  BootomSheetCheckBox(
                    onChanged: (p0) {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 360,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(
                      getTranslated('addons', context)!,
                      style: rubikMedium,
                    ),
                  ),
                  AddOnsCheckBox(
                    onChanged: (p0) {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 360,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(
                          'Total Price',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(
                          '\$ 254',
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(),
                      Container(
                        width: 194,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
