import 'package:test_layout_switch/domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  HomeDataModel({
    required super.id,
    // required super.gender,
    required super.imageUrl,
    required super.name,
    // required super.race,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        id: json["id"],
        // gender: json["gender"],
        imageUrl: json["image"],
        name: json["name"],
        // race: json["race"],
      );
}
