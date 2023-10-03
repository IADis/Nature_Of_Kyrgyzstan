import 'package:flutter/material.dart';

class MountainsModel {
  MountainsModel({
    required this.image,
    required this.name,
    required this.navigate,
    required this.count,
  });

  final String image;
  final String name;
  final Widget navigate;
  final Widget count;
}
