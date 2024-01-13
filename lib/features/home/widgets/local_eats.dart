import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart'as p;
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/features/home/widgets/my_local_eat_food_widget.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class LocalEatsWidget extends StatefulWidget {
  @override
  State<LocalEatsWidget> createState() => _LocalEatsWidgetState();
}

class _LocalEatsWidgetState extends State<LocalEatsWidget> {


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
          Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              return SizedBox(
                height: 250,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    productProvider.selectedLocalEatsItem = index;
                    return MyLocalEatFoodWidget(product: productProvider.productList?[index]);
                  },
                  itemCount: productProvider.productList?.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // widget for image showing

}
