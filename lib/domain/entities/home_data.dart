import 'package:flutter/material.dart';

class HomeData {
  final int id;
  final String name;
  final String race;
  final String gender;
  final String imageUrl;
  // final List<TransformationData> transformationData;

  HomeData({
    required this.id,
    required this.gender,
    required this.imageUrl,
    required this.name,
    required this.race,
    // required this.transformationData
  });
}

class TransformationData {
  final int id;
  final String name;
  final String imageUrl;

  TransformationData({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}