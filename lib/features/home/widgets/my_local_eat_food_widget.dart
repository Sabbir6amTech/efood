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

 // void openFoodDetailsModal() {
 //    showModalBottomSheet(
 //      shape:const RoundedRectangleBorder(
 //        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
 //      ),
 //      backgroundColor: Colors.grey.shade200,
 //      isScrollControlled: true,
 //      context: context,
 //      builder: (BuildContext context) {
 //        return Consumer<ProductProvider>(
 //          builder: (context, productProvider, child) {
 //            return SizedBox(
 //              height: MediaQuery.of(context).size.height * 0.8,
 //              child: ListView.builder(
 //                itemCount: 5,
 //                itemBuilder: (context, index) {
 //                  return DemoBottomSheet(product: productProvider.productList?[index]);
 //                },
 //              ),
 //            );
 //          },
 //        );
 //      },
 //    );
 //  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          width: 160,
          height: 240,
          child: Wrap(
            children: [
              Card(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10)),
                      child: InkWell(
                        onTap: (){
                          //penFoodDetailsModal();
                          },
                        child: CustomImageWidget(
                            image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls?.productImageUrl}/${widget.product?.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.redAccent.withOpacity(0.3),
                        ),
                        child:  Center(
                          child: Text(
                            '${widget.product?.discount}',
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
