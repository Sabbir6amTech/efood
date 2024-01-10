import 'package:flutter/material.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class AddOnsCheckBox extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onChanged;

  AddOnsCheckBox({required this.onChanged});

  @override
  State<AddOnsCheckBox> createState() => _AddOnsCheckBoxState();
}

class _AddOnsCheckBoxState extends State<AddOnsCheckBox> {

  List<Map<String, dynamic>> items = [
    {'name': 'Pepsi', 'price': 46},
    {'name': 'Chicken Fry', 'price': 46},
    {'name': 'Sause', 'price': 46},

  ];

  List<Map<String, dynamic>> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      widget.onChanged(_selectedItems);
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
    );
  }
}
