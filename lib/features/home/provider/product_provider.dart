
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



  // provider for addons start

  List<int>? _selectedAddons;
  List<int>? get selectedAddons => _selectedAddons;

  bool? _value = false;
  bool? get value => _value;

  set value(bool? val){
    _value = val;
  }

  // demo -----------

  late List<bool> selected = [];


  void addAllAddons(int length){
    for(int i = 0; i < length; i++){
      selected.add(false);
    }
  }

  void updateSelectedItem(int index, bool value) {
    selected[index] = value;
    if (value) {
      selectedAddons?.add(index);
    } else {
      selectedAddons?.remove(index);
    }
    notifyListeners();
  }

  // demo for variations.....................

  // Provider for variations start

  late List<bool> variationIndex = [];


  void addVariation(int length, int index){
    for(int i = 0; i < length; i++){
      variationIndex.add(false);
    }

  }

  List<int>? _selectedVariations;

  List<int>? get selectedVariations => _selectedVariations;

  void updateSelectedVariation(int index, bool value) {
    variationIndex[index] = value;
    if (value) {
      selectedVariations?.add(index);
    } else {
      selectedVariations?.remove(index);
    }
    notifyListeners();
  }

  // get which index is selected

  List<int> getSelectedVariations(){
    List<int> selectedIndex = [];

    for(int i = 0; i < variationIndex.length; i++){
      if(variationIndex[i]){
        selectedIndex.add(i);
      }
    }
    return selectedIndex;
  }



  // addons provider end




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