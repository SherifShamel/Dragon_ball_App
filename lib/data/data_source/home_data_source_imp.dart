import 'package:dio/dio.dart';
import 'package:test_layout_switch/data/data_source/home_data_source.dart';

class HomeDataSourceImp implements HomeDataSource {
  final Dio dio;

  HomeDataSourceImp({required this.dio});

  @override
  Future<Response> getData(String? id) async {
    return await dio.get(
      '/api/characters/$id',
    );
  }
}
