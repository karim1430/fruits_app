import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/repos/product_repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, ProductEntity>> bestSellingProduct() {
    // TODO: implement bestSellingProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct() {
    // TODO: implement getProduct
    throw UnimplementedError();
  }
}
