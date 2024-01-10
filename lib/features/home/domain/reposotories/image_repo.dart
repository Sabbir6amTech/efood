import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/utill/images.dart';

class DishWidgetRepo {
  final DioClient? dioClient;

  DishWidgetRepo({required this.dioClient});

  final List<Map<String, dynamic>> _imageWithTitleList = [
    {"image": Images.burger, "title": "Burger"},
    {"image": Images.sandwitch, "title": "Sandwitch"},
    {"image": Images.sushi, "title": "Sushi"},
    {"image": Images.ramen, "title": "Ramen"},
    {"image": Images.drinks, "title": "Drinks"},
    {"image": Images.breakfast, "title": "Ramen"},
    {"image": Images.shwarma, "title": "sharma"},
    {"image": Images.fork, "title": "More"},

    {"image": Images.burger, "title": "Burger"},
    {"image": Images.sandwitch, "title": "Sandwitch"},
    {"image": Images.sushi, "title": "Sushi"},
    {"image": Images.ramen, "title": "Ramen"},
    {"image": Images.drinks, "title": "Drinks"},
    {"image": Images.breakfast, "title": "Ramen"},
    {"image": Images.shwarma, "title": "sharma"},
    {"image": Images.fork, "title": "More"},
    // Add more image-title pairs as needed
  ];



  Future<List<Map<String, dynamic>>> getDishItem() async {

    return _imageWithTitleList; // Return the updated image list
  }
}
