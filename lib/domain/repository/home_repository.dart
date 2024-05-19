import 'package:dartz/dartz.dart';
import 'package:test_layout_switch/core/failure/failure.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeData>>> getData();
}
