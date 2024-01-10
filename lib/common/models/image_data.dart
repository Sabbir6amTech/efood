import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this to access rootBundle

class ImageData {
  final String imagePath;
  final String title;
  final double rating;
  final double price;

  ImageData({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
  });


}

