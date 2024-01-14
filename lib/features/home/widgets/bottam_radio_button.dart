import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';

import 'package:provider/provider.dart';

class ModalSheetRadioButton<T> extends StatefulWidget {
  final Product? product;
  const ModalSheetRadioButton({Key? key, this.product}) : super(key: key);

  @override
  State<ModalSheetRadioButton<T>> createState() =>
      _ModalSheetRadioButtonState<T>();
}

class _ModalSheetRadioButtonState<T> extends State<ModalSheetRadioButton<T>> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.product!.variations!.length,
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
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${variation.name}',
                              style: rubikBold,
                            ),
                            Text(
                              widget.product?.variations?[index].isMultiSelect == true
                                  ? 'Select Multiple'
                                  : 'Select One',
                              style: const TextStyle(
                                  color: Colors.redAccent, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      variation.isRequired == true
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 18.0, top: 5),
                              child: Container(
                                width: 60,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: const Center(
                                    child: Text(
                                  'required',
                                  style: TextStyle(color: Colors.redAccent),
                                )),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                   Column(
                    children: variation.variationValues!.map((value) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedValue = (selectedValue) as int;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  title: Text('${value.level}'),
                                  value: index,
                                  contentPadding: EdgeInsets.zero,
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as int;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  '${value.optionPrice}',
                                  style: robotoRegular,
                                ),
                              ),
                            ],
                          ),
                        );
                    }).toList(),
                   ),
                  /*Container(
                    height: 220,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.product?.variations?.length,
                      itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RadioListTile(
                          title: Text(
                              '${widget.product?.variations?[index].variationValues?[index].level}'),
                          value: index,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as int;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            '${widget.product?.variations?[index].variationValues?[index].optionPrice}',
                            style: robotoRegular,
                          ),
                        )
                      ],
                    );
                      },
                    ),
                  ),*/
                ],
              );
            },
          ),
        );
      },
    );
  }
}
