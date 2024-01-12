import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/provider/product_provider.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class AddOnsCheckBox extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onChanged;
  final ProductProvider? productProvider;

  AddOnsCheckBox({required this.onChanged, this.productProvider});

  @override
  State<AddOnsCheckBox> createState() => _AddOnsCheckBoxState();
}

class _AddOnsCheckBoxState extends State<AddOnsCheckBox> {

  @override
  void initState() {
    super.initState();
    widget.productProvider?.getProductList();
    widget.productProvider?.getAddOnsList();
  }

  List<Map<String, dynamic>> items = [];


  final List<Map<String, dynamic>> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (widget.productProvider?.addOnsList ?? []).map((addOn) {
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
                          'id': addOn.id,
                          'name': addOn.name,
                          'price': addOn.price,
                          'created_at': addOn.createdAt,
                          'updated_at': addOn.updatedAt,
                          'tax': addOn.tax,
                        });
                      } else {
                        _selectedItems.removeWhere((item) => item['id'] == addOn.id);                      }
                      widget.onChanged(_selectedItems);
                    });
                  },
                ),
                const SizedBox(width: 5),
                Text(
                  addOn.name.toString(),
                  style: rubikRegular,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Text(
                '\$${addOn.price}',
                style: robotoRegular,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

}
