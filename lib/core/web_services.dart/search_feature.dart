import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/data/data_models/home_data_model.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';

class SearchFeature {
  static Future<List<HomeData>> search(String query) async {
    var dio = Dio(
      BaseOptions(baseUrl: Constants.baseUrl),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
      ),
    );
    var response = await dio.get(
      "api/characters",
      queryParameters: {
        "id": query,
      },
    );
    return HomeDataModel.fromJson(response.data) as List<HomeData>;
  }
}
