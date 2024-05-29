import 'package:flutter/material.dart';
import 'package:test_layout_switch/data/data_models/home_data_model.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/cubit.dart';

class CharacterImageView extends StatelessWidget {
  final HomeDataModel homeDataModel;
  final TransformationsModel transformationsModel;

  const CharacterImageView({
    super.key,
    required this.homeDataModel,
    required this.transformationsModel

  });

  @override
  Widget build(BuildContext context) {
    return Image.network(homeDataModel.imageUrl);
  }
}
