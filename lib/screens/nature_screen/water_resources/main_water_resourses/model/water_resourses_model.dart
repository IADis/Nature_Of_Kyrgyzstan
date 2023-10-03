import 'package:flutter/material.dart';

class WaterResoursesModel {
  WaterResoursesModel({
    required this.name,
    required this.image,
    required this.navigate,
    required this.count,
  });
  final String name;
  final String image;
  final Widget navigate;
  final Widget count;
}
