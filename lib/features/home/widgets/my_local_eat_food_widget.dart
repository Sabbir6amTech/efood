import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/image_data.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/common/widgets/custom_food_image.dart';
import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
import 'package:flutter_restaurant/features/home/demo_bottom_sheet.dart';
import 'package:flutter_restaurant/features/home/domain/reposotories/product_repo.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

import 'local_eats_bootm_sheet.dart';

class MyLocalEatFoodWidget extends StatefulWidget {
  final Product? product;

  const MyLocalEatFoodWidget({Key? key,

    required this.product
  }) : super(key: key);

  @override
  State<MyLocalEatFoodWidget> createState() => _MyLocalEatFoodWidgetState();
}

class _MyLocalEatFoodWidgetState extends State<MyLocalEatFoodWidget> {

  //late final Product product;

  void openFoodDetailsModal(BuildContext context, Product? selectedProduct) {
    final productProvider = Provider.of<ProductProvider>(context, listen: false);

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey.shade200,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return DemoBottomSheet(product: selectedProduct);
      },
    );

    productProvider.getProductList();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openFoodDetailsModal(context, widget.product);
      },
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
        ),
        child: SizedBox(
          height: 235,
          width: 200,
          child: Wrap(
            children: [
              Card(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    SizedBox(
                      height: 145,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: InkWell(
                          onTap: (){
                            //penFoodDetailsModal();
                            },
                          child: CustomImageWidget(
                              image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls?.productImageUrl}/${widget.product?.image}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        width: 62,
                        height: 21,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.redAccent.withOpacity(0.6),
                        ),
                        child:  Center(
                          child: Text(
                            '${widget.product?.discount}',
                            style: rubikRegular
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 10,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 24,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              child: InkWell(
                                onTap: () => {},
                                child: const Icon(
                                  Icons.add,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'ADD',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: IconButton(
                        onPressed: () {},
                        icon: Container(

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 154,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product?.name}',
                        style: rubikMedium,
                      ),
                      const SizedBox(height: 4),
                      /* const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //const Icon(Icons.star, color: Colors.yellow),
                           SizedBox(width: 4),
                          Text(
                            '${widget.product?.rating}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),*/
                      const SizedBox(height: 4),
                      Text(
                          '\$ ${widget.product?.price}',
                          style: robotoRegular
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
