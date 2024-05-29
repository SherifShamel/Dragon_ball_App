import 'package:test_layout_switch/domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  HomeDataModel({
    required super.id,
    required super.gender,
    required super.imageUrl,
    required super.name,
    required super.race,
    // required super.transformationData,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        id: json["id"],
        gender: json["gender"],
        imageUrl: json["image"],
        name: json["name"],
        race: json["race"],
        // transformationData: json["transformations"],
      );
}

class TransformationsModel extends TransformationData {
  TransformationsModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });
  factory TransformationsModel.fromJson(Map<String, dynamic> json) => TransformationsModel(
    id: json["id"],
    imageUrl: json["image"],
    name: json["name"],
  );

}
