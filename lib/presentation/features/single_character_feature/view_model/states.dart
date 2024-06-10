import 'package:test_layout_switch/domain/entities/transformation_data.dart';

sealed class CharacterStates {}

class CharacterLoadingState extends CharacterStates {}

class CharacterErrorState extends CharacterStates {}

class CharacterSuccessState extends CharacterStates {
  final List<TransformationData> transformationData;

  CharacterSuccessState({required this.transformationData});
}
