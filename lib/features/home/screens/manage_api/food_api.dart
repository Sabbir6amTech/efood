import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';
import 'package:http/http.dart' as http;

class FoodApi extends StatefulWidget {
  const FoodApi({Key? key}) : super(key: key);

  @override
  State<FoodApi> createState() => _FoodApiState();
}

class _FoodApiState extends State<FoodApi> {

  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('${AppConstants.latestProduct}?limit=12&&offset=1'));

      if (response.statusCode == 200) {
        setState(() {
          products = json.decode(response.body)['data'];
        });
      } else {

        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error gracefully (show error message, retry option, etc.)
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
