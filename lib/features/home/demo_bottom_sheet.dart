import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/config_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/features/home/widgets/add_ons_checkbox.dart';
import 'package:flutter_restaurant/features/home/widgets/variation_check_box.dart';
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

  double? productPrice;
  double? discountPrice;



  int currentIndex = 0;

  void totalPriceFunction(ProductProvider productProvider){
    List<int> selectedVariations = productProvider.getSelectedVariations();

   // double totalPrice = calculateTotalPrice(widget.product?.variations?[index], selectedVariations);
  }

  double calculateTotalPrice(double productPrice, List<int> selectedVariations) {
    double totalPrice = productPrice;

    for (int index in selectedVariations) {
      double variationPrice = widget.product?.variations?[index].variationValues?[index].optionPrice ?? 0;
      totalPrice += variationPrice;
    }

    return totalPrice;
  }




  @override
  Widget build(BuildContext context) {

    productPrice = widget.product?.price;
    discountPrice = widget.product?.discount;
    double? totalPrice = (productPrice ?? 0) - (discountPrice ?? 0);

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        final SplashProvider splashProvider = Provider.of<SplashProvider>(context,listen: false);

        return SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                  child: CustomImageWidget(
                    image: '${splashProvider.baseUrls?.productImageUrl}/${widget.product?.image}',
                  ),
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
                        Expanded(
                          child: Padding(
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
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '\$ ${widget.product?.price}',
                                style:const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontSize: 14
                                )
                              ),
                              const SizedBox(width: 5,),
                              Text( '\$ $totalPrice',style: rubikMedium,)
                            ],
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
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Description',
                    style: rubikMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    height: 35,
                    width: 92,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFF5F3),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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

            Visibility(
              visible: widget.product!.variations!.isEmpty ? false : true,
              replacement: const SizedBox.shrink(),
              child: VariationCheckBox(product: widget.product),
            ),
            const SizedBox(height: 10,),
            // Addons section
            Visibility(
              visible: widget.product!.addOns!.isEmpty ? false : true,
              replacement: const SizedBox.shrink(),
              child: AddOnsCheckBox(product: widget.product),
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
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 10),
                        child: Text(
                          'Total', style: TextStyle(color: Colors.redAccent, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0, top: 10),
                        child: Text(
                          ('\$ $totalPrice'),
                          style: const TextStyle(color: Colors.redAccent, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 105,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.4),
                                    shape: BoxShape.circle
                                  ),
                                  child:const Center(child: Text('-')),
                                ),
                              ),
                              const Text('1'),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent.withOpacity(0.8),
                                  ),
                                  child:const Center(child: Text('+')),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            width: 194,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.redAccent,
                            ),
                            child: const Center(
                                child: Text(
                              'Add to Cart',
                              style: rubikMedium
                            )),
                          ),
                        )
                      ],
                    ),
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
