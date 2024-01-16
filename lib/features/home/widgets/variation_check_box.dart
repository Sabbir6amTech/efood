import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

import 'package:provider/provider.dart';

class VariationCheckBox<T> extends StatefulWidget {
  final Product? product;
  const VariationCheckBox({Key? key, this.product}) : super(key: key);

  @override
  State<VariationCheckBox<T>> createState() => _VariationCheckBoxState<T>();
}

class _VariationCheckBoxState<T> extends State<VariationCheckBox<T>> {


  @override
  void initState() {
    super.initState();
    ProductProvider productProvider = Provider.of<ProductProvider>(context,listen: false);
   // productProvider.addVariation(widget.product!.variations!.variationValues!.length);
    for(int i = 0; i < (widget.product?.variations?.length ?? 0); i++) {
      productProvider.addVariation(widget.product!.variations![i].variationValues!.length,i);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return Container(
          width: 350,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.product?.variations?.length,
            itemBuilder: (context, index) {
              final variation = widget.product!.variations![index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${variation.name}',
                              style: rubikBold,
                            ),
                            Text(
                              variation.isMultiSelect == true
                                  ? 'Select Multiple'
                                  : 'Select One',
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      variation.isRequired == true ? Padding(
                              padding: const EdgeInsets.only(right: 18.0, top: 5),
                              child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child:  Center(
                                    child: Text(
                                  getTranslated('required', context)!,
                                  style:const TextStyle(fontSize: Dimensions.fontSizeSmall,color: Colors.redAccent),
                                )),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  ListView.builder(
                    itemCount: variation.variationValues?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, indexex) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          variation.isMultiSelect == true
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CheckboxListTile(
                                  dense: true,
                                  title: Text('${variation.variationValues?[indexex].level}'),
                                  value: productProvider.variationIndex[indexex],
                                  controlAffinity: ListTileControlAffinity.leading,
                                  contentPadding: EdgeInsets.zero,
                                  activeColor: Colors.redAccent,
                                  onChanged: (value) {
                                    productProvider.updateSelectedVariation(indexex, value!);
                                  },
                                ),

                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  '\$ ${variation.variationValues?[indexex].optionPrice}', style: robotoRegular,
                                ),
                              ),
                            ],
                          ) : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  selected: true,
                                  title: Text('${variation.variationValues?[indexex].level}'),
                                  value: indexex,
                                  activeColor: Colors.redAccent,
                                  contentPadding: EdgeInsets.zero,
                                  groupValue: false,
                                  onChanged: (value) {

                                  },
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text('\$ ${variation.variationValues?[indexex].optionPrice}',
                                  style: robotoRegular,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )


                ],
              );
            },
          ),
        );
      },
    );
  }
}
