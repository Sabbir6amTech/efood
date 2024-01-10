import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ModalSheetRadioButton<T> extends StatefulWidget {
  final Function(T?) onChanged;

  const ModalSheetRadioButton({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ModalSheetRadioButton<T>> createState() => _ModalSheetRadioButtonState<T>();
}

class _ModalSheetRadioButtonState<T> extends State<ModalSheetRadioButton<T>> {
  var _selectedValue;

  List<Map<String, dynamic>> radioValues = [
    {'label': 'Small', 'price': '\$45', 'value': 1 as T},
    {'label': 'Medium', 'price': '\$90', 'value': 2 as T},
    {'label': 'Large', 'price': '\$415', 'value': 3 as T},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: radioValues.map((radioValue) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio<T>(
                  activeColor: Colors.redAccent,
                  value: radioValue['value'],
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                      widget.onChanged(_selectedValue);
                    });
                  },
                ),
                Text(
                  getTranslated(radioValue['label'].toLowerCase(), context)!,
                  style: robotoRegular,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Text(
                radioValue['price'],
                style: robotoRegular,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
