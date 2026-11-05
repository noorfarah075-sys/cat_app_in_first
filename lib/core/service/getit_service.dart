import 'package:cat_app/core/database/api/dio_service.dart';
import 'package:cat_app/data/data_source/cat_local_data_source.dart';
import 'package:cat_app/data/data_source/cat_remote_data_source.dart';
import 'package:cat_app/data/repository/cat_repository_imp.dart';
import 'package:cat_app/domain/usecase/get_breeds_use_case.dart';
import 'package:cat_app/domain/usecase/get_fact_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// 2. Register them at app startup
void setUpGetIt() {
   getIt.registerLazySingleton(()=> CatLocalDataSourceImp());
      getIt.registerLazySingleton(
        ()=> CatRemoteDataSourceImpl(
          dioService: getIt.dioService
          ));
      getIt.registerLazySingleton(
        ()=> DioService(
          getIt.dio
          )); 
            getIt.registerLazySingleton<Dio>(
              ()=> Dio( )
              );
            getIt.registerLazySingleton(
            () => CatRepositoryImp(
              catLocalDataSource: getIt.catLocalDataSourceImp,
             catRemoteDataSource: getIt.catRemoteDataSourceImpl
               ));
              getIt.registerLazySingleton<GetFactUseCase>(
               () => GetFactUseCase(catRepository: getIt.catRepositoryImp),
              );
               getIt.registerLazySingleton<GetBreedsUseCase>(
              () => GetBreedsUseCase(catRepository: getIt.catRepositoryImp),
              );
              }
               extension GetitExtension on GetIt {
              Dio get dio => this<Dio>();
               DioService get dioService => this<DioService>();
               CatLocalDataSourceImp get catLocalDataSourceImp => this<CatLocalDataSourceImp>();
               CatRemoteDataSourceImpl get catRemoteDataSourceImpl => this<CatRemoteDataSourceImpl>();
                CatRepositoryImp get catRepositoryImp => this<CatRepositoryImp>();
                     GetFactUseCase get getFactUseCase => this<GetFactUseCase>();
                  GetBreedsUseCase get getBreedsUseCase => this<GetBreedsUseCase>();
                       }