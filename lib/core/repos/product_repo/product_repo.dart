import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductEntity>> getProduct();
  Future<Either<Failure, ProductEntity>> bestSellingProduct();
}
