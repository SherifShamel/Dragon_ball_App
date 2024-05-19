import 'package:flutter/material.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';

class CharacterCardWidget extends StatelessWidget {
  final HomeData homeData;

  const CharacterCardWidget({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Constants.mediaQuery.height * 0.5,
          child: Image.network(
            homeData.imageUrl,
          ),
        ),
        Center(
          child: Text(homeData.name),
        ),
      ],
    );
  }
}
