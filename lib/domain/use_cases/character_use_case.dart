import 'package:dartz/dartz.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';
import 'package:test_layout_switch/domain/repository/character_repository.dart';

import '../../core/failure/failure.dart';

class CharacterUseCase {
  final CharacterRepository characterRepository;

  CharacterUseCase({required this.characterRepository});

  Future<Either<Failure, List<TransformationData>>> execute(String id) async {
    return await characterRepository.getTransformation(id);
  }
}
