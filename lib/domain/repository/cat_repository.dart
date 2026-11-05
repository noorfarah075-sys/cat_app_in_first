import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  const CatRepository();
  Future<Either<String, FactEntity>> getFact();
 Future<Either<String, List<BreedsEntity>>> getBreeds();
}