import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant/features/home/domain/reposotories/image_repo.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:provider/provider.dart';
import '../domain/models/dish_discoveries_model.dart';

class ImageWithTitleProvider extends ChangeNotifier {
  final ImageRipo imageRipo;

  ImageWithTitleProvider({required this.imageRipo});

  List<ImageWithTitle>? _imageWithTitleList = [];

  List<ImageWithTitle>? get imageWithTitleList => _imageWithTitleList;

  Future<void> getBannerImage() async {
    _imageWithTitleList = null;


    Future.delayed(const Duration(seconds: 1)).then((value) async {
     _imageWithTitleList = [];
      try {
        final List<Map<String, dynamic>> images = await imageRipo.getDishItem();
        _imageWithTitleList?.addAll(images.map((item) =>ImageWithTitle.fromJson(item)).toList());

      } catch (e) {
        print('Error fetching images: $e');
      }
     notifyListeners();

    });
  }
}

