import 'package:dartz/dartz.dart';
import 'package:test_layout_switch/core/failure/failure.dart';
import 'package:test_layout_switch/domain/entities/transformation_data.dart';

abstract class CharacterRepository{
  Future<Either<Failure,List<TransformationData>>> getTransformation(String id);
}