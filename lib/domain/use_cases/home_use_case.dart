import 'package:dartz/dartz.dart';
import 'package:test_layout_switch/domain/entities/home_data.dart';
import 'package:test_layout_switch/domain/repository/home_repository.dart';

import '../../core/failure/failure.dart';

class HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCase(this.homeRepository);

  Future<Either<Failure, List<HomeData>>> execute() async {
    return await homeRepository.getData();
  }
}
