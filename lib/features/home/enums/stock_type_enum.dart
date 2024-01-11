import 'package:flutter_restaurant/common/models/enum_values_model.dart';

enum StockType {
  DAILY,
  FIXED,
  UNLIMITED
}

final stockTypeValues = EnumValuesModel({
  "daily": StockType.DAILY,
  "fixed": StockType.FIXED,
  "unlimited": StockType.UNLIMITED
});
