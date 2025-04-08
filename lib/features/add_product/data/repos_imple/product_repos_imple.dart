import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_dashboard/core/failures.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/images_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/products_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruits_dashboard/features/add_product/domain/repos/products_repos.dart';

class ProductReposImple extends ProductsRepos {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ImagesRemoteDataSource imagesRemoteDataSource;

  ProductReposImple(this.imagesRemoteDataSource, {
    required this.productsRemoteDataSource,
  });
  @override
  Future<Either<Failures, void>> addProduct({
    required AddProductEntity addProductEntity,
  }) async {
    try {

      addProductEntity.imagePath = await imagesRemoteDataSource.uploadImageToCloudNairy(imageFile: addProductEntity.imageFile);

      return right(
        productsRemoteDataSource.addProduct(addProductEntity: addProductEntity),
      );
    } catch (e) {
      log(' error in product reposimple is ${e.toString()}');
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
