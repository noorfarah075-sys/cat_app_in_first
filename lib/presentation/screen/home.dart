import 'package:cat_app/core/database/api/dio_service.dart';
import 'package:cat_app/data/data_source/cat_local_data_source.dart';
import 'package:cat_app/data/data_source/cat_remote_data_source.dart';
import 'package:cat_app/data/repository/cat_repository_imp.dart';
import 'package:cat_app/domain/entities/fact_entity.dart';
import 'package:cat_app/domain/usecase/get_fact_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Dio dio = Dio();
            DioService dioService = DioService(dio);
            CatLocalDataSourceImp catLocalDataSourceImp = CatLocalDataSourceImp();
            CatRemoteDataSource catRemoteDataSource = CatRemoteDataSourceImpl(
              dioService: dioService,
            );
            CatRepositoryImp catRepositoryImp = CatRepositoryImp(
              catLocalDataSource: catLocalDataSourceImp,
              catRemoteDataSource: catRemoteDataSource,
            );
          GetFactUseCase getFactUseCase = GetFactUseCase(
            catRepository:catRepositoryImp,
            );
            Either<String, FactEntity> data = await getFactUseCase.excute();
            data.fold(
            (String l) {
              print(l);
            },
            (FactEntity r) {
              print(r);
            }
            );
          },child: const Text('test'),
        ),
      ),
    );
  }
}