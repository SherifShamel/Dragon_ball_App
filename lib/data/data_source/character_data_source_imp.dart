import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:test_layout_switch/data/data_source/character_data_source.dart';

class CharacterDataSourceImp implements CharacterDataSource {
  final Dio dio;

  CharacterDataSourceImp({required this.dio});

  @override
  Future<Response> getTransformationDetails(String id) async {
    return await dio.get('/api/characters/$id');
  }
}
