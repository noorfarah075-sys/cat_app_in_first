import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetFactUseCase {
  final CatRepository catRepository;
  const GetFactUseCase({required this.catRepository});

  Future<Either<String, FactEntity>> call() {
    return catRepository.getFact();
  }
}