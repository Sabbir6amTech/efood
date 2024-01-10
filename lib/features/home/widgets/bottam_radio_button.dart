import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ModalSheetRadioButton extends StatefulWidget {
  final Function(int) onChanged;

  const ModalSheetRadioButton({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ModalSheetRadioButton> createState() => _ModalSheetRadioButtonState();
}

class _ModalSheetRadioButtonState extends State<ModalSheetRadioButton> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(getTranslated('small', context)!,style: robotoRegular,),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
              widget.onChanged(_selectedValue);
            });
          },
        ),
        RadioListTile(
          title: Text(getTranslated('medium', context)!,style: robotoRegular,),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
              widget.onChanged(_selectedValue);
            });
          },
        ),
        RadioListTile(
          title: Text(getTranslated('large', context)!,style: robotoRegular,),
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value as int;
              widget.onChanged(_selectedValue);
            });
          },
        ),
      ],
    );
  }
}