import 'package:dio/dio.dart';

abstract class CharacterDataSource{
  Future<Response> getTransformationDetails(String id);
}