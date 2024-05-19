import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_layout_switch/core/failure/failure.dart';
import 'package:test_layout_switch/core/failure/server_failure.dart';
import 'package:test_layout_switch/data/data_models/home_data_model.dart';
import 'package:test_layout_switch/data/data_source/home_data_source.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';
import 'package:test_layout_switch/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImp(this.homeDataSource);

  @override
  Future<Either<Failure, List<HomeData>>> getData() async {
    try {
      final response = await homeDataSource.getData();
      if (response.statusCode == 200) {
        List<HomeDataModel> homeDataList = [];

        var responseDataList = response.data["items"];

        for (var element in responseDataList) {
          homeDataList.add(HomeDataModel.fromJson(element));
        }
        return Right(homeDataList);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusMessage.toString(),
          ),
        );
      }
    } on DioException catch (error) {
      return Left(ServerFailure(statusCode: error.toString()));
    }
  }
}
