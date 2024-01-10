import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodApi extends StatefulWidget {
  const FoodApi({Key? key}) : super(key: key);

  @override
  State<FoodApi> createState() => _FoodApiState();
}

class _FoodApiState extends State<FoodApi> {

  List<dynamic> products = []; // List to store fetched products

  @override
  void initState() {
    super.initState();
    fetchData();
  }


  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://efood-admin.6amtech.com/api/v1/products/latest?limit=12&&offset=1'));

      if (response.statusCode == 200) {
        // If the call to the server was successful, parse JSON response
        setState(() {
          products = json.decode(response.body)['data'];
        });
      } else {
        // If the call to the server was unsuccessful, throw an error.
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
