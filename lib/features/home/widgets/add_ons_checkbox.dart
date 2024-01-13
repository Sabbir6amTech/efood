import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class AddOnsCheckBox extends StatefulWidget {
  final Product? product;
  const AddOnsCheckBox({Key? key, required this.product}) : super(key: key);

  @override
  State<AddOnsCheckBox> createState() => _AddOnsCheckBoxState();
}

class _AddOnsCheckBoxState extends State<AddOnsCheckBox> {
  final List<Map<String, dynamic>> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return Expanded(
          child: ListView.builder(
            itemCount: widget.product!.addOns!.length,
            itemBuilder: (context, index) {
              final addOn = widget.product?.addOns?[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.redAccent,
                        value: _selectedItems.contains(addOn),
                        onChanged: (checked) {
                          setState(() {
                            if (checked != null && checked) {
                              _selectedItems.add({
                                'name': addOn?.name,
                                'price': addOn?.price,
                              });
                            } else {
                              _selectedItems.removeWhere((item) => item['id'] == addOn?.id);
                            }
                            //widget.onChanged(_selectedItems);
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${addOn?.name}',
                        style: robotoRegular,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      '\$${addOn?.price}',
                      style: robotoRegular,
                    ),
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
