import 'package:cat_app/core/database/api/api_consts.dart';
import 'package:cat_app/core/database/api/dio_service.dart';
import 'package:cat_app/core/error/server_exception.dart';
import 'package:cat_app/data/models/breeds_model.dart';
import 'package:cat_app/data/models/fact_model.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CatRemoteDataSource {
  Future<Either<String, FactEntity>> getFact();
    Future<Either<String, List<BreedsEntity>>> getBreeds();
}
 class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final DioService dioService;
  const CatRemoteDataSourceImpl({required this.dioService});
  @override
  Future<Either<String, List<BreedsEntity>>> getBreeds() async {
   try {
       var res = await dioService.get(path: ApiConsts.breedsEndpoint);
       List<BreedsModel> data = List.from(res["data"]).map((e) => BreedsModel.fromJson(e)).toList();
        return Right (data);
    }on ServerException catch (e) {
      return Left(e.message);
    }catch (e) {
      return Left(e.toString());
    } 
  }

  @override
  Future<Either<String, FactEntity>> getFact() async {
    //get data from api
    try {
       var res = await dioService.get(path: ApiConsts.factsEndpoint);
    res as Map<String, dynamic>;
     FactModel data = FactModel.fromJson(res as Map<String, dynamic>);
    return Right (data);
    }on ServerException catch (e) {
      return Left(e.message);
    }catch (e) {
      return Left(e.toString());
    } 
    }
      }
      //
