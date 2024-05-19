import 'package:test_layout_switch/domain/entities/home_data.dart';

sealed class HomeStates {}

class SuccessHomeState extends HomeStates {
  final List<HomeData> dataList;

  SuccessHomeState(this.dataList);
}

class LoadingHomeState extends HomeStates {}

class ErrorHomeState extends HomeStates {
  final String errorMsg;
  ErrorHomeState(this.errorMsg);
}
