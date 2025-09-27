import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub/core/services/firebase_services.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final FirebaseServices firebaseServices;

  ProductRepoImpl(this.firebaseServices);
  @override
  Future<Either<Failure, List<ProductEntity>>> bestSellingProduct() async {
    try {
      final data =
          await firebaseServices.getData(
                path: BackendEndpoint.addProduct,
                quary: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> productEntity = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(productEntity);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure('failer in to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      final data =
          await firebaseServices.getData(path: BackendEndpoint.addProduct)
              as List<Map<String, dynamic>>;
      List<ProductEntity> productEntity = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(productEntity);
    } catch (e) {
      log(' getProduct()${e.toString()}');
      return Left(ServerFailure('failer in to get products'));
    }
  }
}
