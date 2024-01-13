
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/home/domain/reposotories/product_repo.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';


class ProductProvider extends ChangeNotifier{
  final ProductRepo productRepo;
  ProductProvider({required this.productRepo});



  List<Product>? _productList;

  int? _selectedLocalEatsItem;


  int? get selectedLocalEatsItem => _selectedLocalEatsItem;

  set selectedLocalEatsItem(int? value) {
    _selectedLocalEatsItem = value;
  }

  List<Product>? get productList => _productList;

  Future<void> getProductList() async{
    if(_productList == null){
      ApiResponseModel apiResponse = await productRepo.getProductList();
      if(apiResponse.response != null && apiResponse.response!.statusCode == 200){
        _productList = [];
        apiResponse.response!.data['products'].forEach((product) => _productList!.add(Product.fromJson(product)));
        notifyListeners();
      }else{
        ApiCheckerHelper.checkApi(apiResponse);
      }
    }
  }



}