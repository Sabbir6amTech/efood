import 'package:flutter_restaurant/common/models/enum_values_model.dart';

enum Name {
  CHEESE,
  COKE,
  WATER
}

final nameValues = EnumValuesModel({
  "Cheese": Name.CHEESE,
  "Coke": Name.COKE,
  "Water": Name.WATER
});
