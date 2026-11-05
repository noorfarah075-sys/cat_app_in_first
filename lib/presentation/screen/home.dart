import 'package:cat_app/core/service/getit_service.dart';
import 'package:cat_app/domain/entities/breeds_entity.dart';
import 'package:cat_app/domain/usecase/get_breeds_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            GetBreedsUseCase getBreedsUseCase =getIt.getBreedsUseCase;
            Either<String, List<BreedsEntity>> data = await getBreedsUseCase();
            data.fold(
            (String l) {
              print(l);
            },
            ( r) {
              print(r);
            }
            );
          },child: const Text('test'),
        ),
      ),
    );
  }
}