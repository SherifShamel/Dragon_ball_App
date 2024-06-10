import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_layout_switch/core/failure/failure.dart';
import 'package:test_layout_switch/core/failure/failures.dart';
import 'package:test_layout_switch/data/data_models/transformation_data_model.dart';
import 'package:test_layout_switch/data/data_source/character_data_source.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';
import 'package:test_layout_switch/domain/repository/character_repository.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final CharacterDataSource characterDataSource;

  CharacterRepositoryImp({required this.characterDataSource});

  @override
  Future<Either<Failure, List<TransformationData>>> getTransformation(
      String id) async {
    try {
      final response = await characterDataSource.getTransformationDetails(id);
      if (response.statusCode == 200) {
        List<TransformationDataModel> transformationDataList = [];

        var responseDataList = response.data["transformations"];

        for (var e in responseDataList) {
          transformationDataList.add(TransformationDataModel.fromJson(e));
        }
        return Right(transformationDataList);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusMessage.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          statusCode: e.toString(),
        ),
      );
    }
  }
}
