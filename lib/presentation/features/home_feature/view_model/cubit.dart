import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_layout_switch/core/failure/server_failure.dart';
import 'package:test_layout_switch/core/web_services.dart/web_services.dart';
import 'package:test_layout_switch/data/data_source/home_data_source.dart';
import 'package:test_layout_switch/data/data_source/home_data_source_imp.dart';
import 'package:test_layout_switch/data/repository_imp/home_repository_imp.dart';
import 'package:test_layout_switch/domain/repository/home_repository.dart';
import 'package:test_layout_switch/domain/use_cases/home_use_case.dart';
import 'package:test_layout_switch/presentation/features/home_feature/view_model/states.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(LoadingHomeState());

  final WebServices _webServices = WebServices();
  late HomeDataSource homeDataSource;
  late HomeRepository homeRepository;
  late HomeUseCase homeUseCase;

  Future<bool> getData(String? id) async {
    emit(LoadingHomeState());

    homeDataSource = HomeDataSourceImp(dio: _webServices.freeDio);
    homeRepository = HomeRepositoryImp(homeDataSource: homeDataSource);
    homeUseCase = HomeUseCase(homeRepository);

    final result = await homeUseCase.execute(id);

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
}
