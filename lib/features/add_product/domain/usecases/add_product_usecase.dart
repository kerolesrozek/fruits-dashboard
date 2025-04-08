import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/failures.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruits_dashboard/features/add_product/domain/repos/products_repos.dart';

class AddProductUsecase {
  final ProductsRepos productsRepos;

  AddProductUsecase({required this.productsRepos});

  Future<Either<Failures, void>> call({
    required AddProductEntity addProductEntity,
  }) async =>
      await productsRepos.addProduct(addProductEntity: addProductEntity);
}
