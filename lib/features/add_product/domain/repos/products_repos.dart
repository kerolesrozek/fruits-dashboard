import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/failures.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class ProductsRepos {
  Future<Either<Failures,void>>addProduct({required AddProductEntity addProductEntity});
}