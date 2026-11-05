import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class GetBreedsUseCase {
  final CatRepository catRepository;
  const GetBreedsUseCase({required this.catRepository});

  Future<Either<String, List<BreedsEntity>>> excute(){
    return catRepository.getBreeds();
  }
}