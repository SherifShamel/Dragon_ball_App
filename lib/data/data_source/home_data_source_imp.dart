import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/data/data_source/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  final Dio dio;

  HomeDataSourceImp({required this.dio});

  @override
  Future<Response> getData() async {
    return await dio.get(
      '/api/characters',
    );
  }
}
