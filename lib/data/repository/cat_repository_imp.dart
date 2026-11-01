import 'package:cat_app/data/data_source/cat_local_data_source.dart';
import 'package:cat_app/data/data_source/cat_remote_data_source.dart';
import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/cat_repository.dart' show CatRepository;

class CatRepositoryImp extends CatRepository{
  final CatRemoteDataSource catRemoteDataSource;
  final CatLocalDataSource catLocalDataSource;
  const CatRepositoryImp({
    required this.catRemoteDataSource,
    required this.catLocalDataSource
    });
  @override
  Future<void> getBreeds() {
    // TODO: implement getBreeds
    throw UnimplementedError();
  }

  @override
  Future<Either<String, FactEntity>> getFact() async{
    return catRemoteDataSource.getFact();
   
  }
 
}