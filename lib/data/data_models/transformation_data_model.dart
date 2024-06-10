import '../../domain/entities/transformation_data.dart';

class TransformationDataModel extends TransformationData {
  TransformationDataModel({
    required super.id,
    required super.name,
    required super.image,
    required super.ki,
  });

  factory TransformationDataModel.fromJson(Map<String, dynamic> json) => TransformationDataModel(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    ki: json["ki"],
  );

}
