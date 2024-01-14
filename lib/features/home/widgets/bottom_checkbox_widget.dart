import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/enums/product_enum_type.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../utill/styles.dart';

class BootomSheetCheckBox extends StatefulWidget {
  final Product? product;

  const BootomSheetCheckBox({
    Key? key,
    required this.product
  }) : super(key: key);

  @override
  _BootomSheetCheckBoxState createState() => _BootomSheetCheckBoxState();
}

class _BootomSheetCheckBoxState extends State<BootomSheetCheckBox> {
  List<Map<String, dynamic>> items = [
    {'name': 'Cuecumber', 'price': 46},
    {'name': 'Tomato & Tango', 'price': 46},
    {'name': 'Burger', 'price': 46},
    {'name': 'Burger', 'price': 46},
    {'name': 'Burger', 'price': 46},

  ];

  List<Map<String, dynamic>> _selectedItems = [];
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: widget.product?.attributes?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CheckboxListTile(
                   // title: Text(widget.product.[index]),
                  value: false,
                  onChanged: (value) {
                    
                  },
              )
                ],
              );
            },
          ),

         /* child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                       activeColor: Colors.redAccent,
                        value: _selectedItems.contains(item),
                        onChanged: (checked) {
                          setState(() {
                            if (checked != null && checked) {
                              _selectedItems.add(item);
                            } else {
                              _selectedItems.remove(item);
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        item['name'].toString(),
                        style: rubikRegular,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      '\$${item['price']}',
                      style: robotoRegular,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),*/
        );
      }
    );
  }
}
