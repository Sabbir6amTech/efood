import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';

class ProductRepo{
  final DioClient? dioClient;

  ProductRepo({required this.dioClient});


  Future<ApiResponseModel> getProductList() async{
    try{
      final response = await dioClient?.get(AppConstants.latestProduct);
      return ApiResponseModel.withSuccess(response!);
    }catch (e){
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

}