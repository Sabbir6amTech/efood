import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/config_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/features/home/widgets/add_ons_checkbox.dart';
import 'package:flutter_restaurant/features/home/widgets/bottam_radio_button.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';
import '../../utill/images.dart';
import 'widgets/bottom_checkbox_widget.dart';

class DemoBottomSheet extends StatefulWidget {
  final Product? product;

  const DemoBottomSheet({Key? key, required this.product}) : super(key: key);

  @override
  State<DemoBottomSheet> createState() => _DemoBottomSheetState();
}

class _DemoBottomSheetState extends State<DemoBottomSheet> {
  int currentIndex = 0; // Assuming this is the current index of the widget
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  child: CustomImageWidget(
                      image:
                          '${Provider.of<SplashProvider>(context, listen: false).baseUrls?.productImageUrl}/${widget.product?.image}'),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
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
                                '${widget.product?.name}',
                                style: rubikMedium,
                              ),
                              // Text('${product?.rating}',style: rubikMedium,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            '\$ ${widget.product?.price}',
                            style:
                                rubikMedium, // Apply highlighting to price if mainPrice is greater than or equal to price
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    '${widget.product?.name}',
                    style: rubikBold,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${widget.product?.productType}'),
                        )
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
                  child: Text('${widget.product?.description}'),
                )),
            //widget.product!.variations!.isNotEmpty ?
            Container(
              width: 350,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ModalSheetRadioButton(product: widget.product,)
            ),
                //: const SizedBox(),
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
                    product: widget.product,
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
                        child: const Center(
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
