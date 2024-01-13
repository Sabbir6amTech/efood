import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:image/image.dart';
import 'package:provider/provider.dart';

class ModalSheetRadioButton<T> extends StatefulWidget {
 final Product? product;
  const ModalSheetRadioButton({Key? key, this.product}) : super(key: key);

  @override
  State<ModalSheetRadioButton<T>> createState() =>
      _ModalSheetRadioButtonState<T>();
}

class _ModalSheetRadioButtonState<T> extends State<ModalSheetRadioButton<T>> {
  final List<Map<String, dynamic>> _selectedItems = [];



  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: widget.product!.variations!.length,
            itemBuilder: (context, index) {
              final variation = widget.product?.variations![index];
              final List<String> labels = [];
              final List<String> price = [];
              for (var value in variation?.variationValues ?? []) {
                labels.add(value.level);
              }

              return Column(
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
                            Text('${widget.product?.variations?[index]}'),

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.redAccent,
                            value: _selectedItems.contains(variation),
                            onChanged: (checked) {
                              setState(() {
                                if (checked != null && checked) {
                                 for(var value in variation?.variationValues ?? []){
                                   _selectedItems.add({
                                     'label': value.level,
                                     'optionPrice': value.optionPrice,
                                   });
                                 }
                                } else {
                                  for (var value in variation?.variationValues ?? []) {
                                    _selectedItems.removeWhere((item) => item['label'] == value.label);
                                  }
                                }
                                //widget.onChanged(_selectedItems);
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          Text(
                            labels[index],
                            style: robotoRegular,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
