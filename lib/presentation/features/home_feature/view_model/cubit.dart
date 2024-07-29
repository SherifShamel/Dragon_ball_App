import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_layout_switch/core/config/constants.dart';
import 'package:test_layout_switch/core/failure/server_failure.dart';
import 'package:test_layout_switch/core/web_services.dart/web_services.dart';
import 'package:test_layout_switch/data/data_models/home_data_model.dart';
import 'package:test_layout_switch/data/data_source/home_data_source.dart';
import 'package:test_layout_switch/data/data_source/home_data_source_imp.dart';
import 'package:test_layout_switch/data/repository_imp/home_repository_imp.dart';
import 'package:test_layout_switch/domain/repository/home_repository.dart';
import 'package:test_layout_switch/domain/use_cases/home_use_case.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/states.dart';

import '../../../../domain/entities/home_data.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(LoadingHomeState());

  final WebServices _webServices = WebServices();
  late HomeDataSource homeDataSource;
  late HomeRepository homeRepository;
  late HomeUseCase homeUseCase;

  Future<bool> getData() async {
    emit(LoadingHomeState());

    homeDataSource = HomeDataSourceImp(dio: _webServices.freeDio);
    homeRepository = HomeRepositoryImp(homeDataSource: homeDataSource);
    homeUseCase = HomeUseCase(homeRepository);

    final result = await homeUseCase.execute();

    return result.fold((fail) {
      var error = fail as ServerFailure;
      emit(ErrorHomeState(error.message ?? ""));
      return Future.value(false);
    }, (data) {
      emit(SuccessHomeState(data));
      // ignore: null_argument_to_non_null_type
      return Future.value(true);
    });
  }


  static Future<List<HomeData>> search(String query) async {
    var dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        queryParameters: {
          "name": query,
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(responseBody: false),
    );
    var response = await dio.get("api/characters/");
    ////
    List<HomeData> homeDataList = [];

    var responseDataList = response.data;

    for (var element in responseDataList) {
      homeDataList.add(HomeDataModel.fromJson(element));
    }
    ////
    return homeDataList;
  }
}
