import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class AddOnsCheckBox extends StatefulWidget {
  final Product? product;
  const AddOnsCheckBox({Key? key, required this.product}) : super(key: key);

  @override
  State<AddOnsCheckBox> createState() => _AddOnsCheckBoxState();
}

class _AddOnsCheckBoxState extends State<AddOnsCheckBox> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.addAllAddons(widget.product!.addOns!.length);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return Container(
          width: 360,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(left: Dimensions.paddingSizeLarge, top: Dimensions.paddingSizeSmall),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('AddOns', style: rubikMedium,),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.product?.addOns?.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            dense: true,
                            value: productProvider.selected[index],
                            activeColor: Colors.redAccent,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('${widget.product?.addOns?[index].name}', style: robotoRegular,),
                            onChanged: (value) {
                              productProvider.updateSelectedItem(index, value!);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(
                            '\$ ${widget.product?.addOns?[index].price}',
                            style: robotoRegular,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ]),
        );
      },
    );
  }
}

