import 'package:flutter/material.dart';

import '../../../utill/styles.dart';

class BootomSheetCheckBox extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onChanged;

  const BootomSheetCheckBox({
    Key? key,
    required this.onChanged,
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
