import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<void> addProduct({required AddProductEntity addProductEntity});
}

class ProductsRemoteDataSourceImple implements ProductsRemoteDataSource {
  @override
  Future<void> addProduct({required AddProductEntity addProductEntity}) async {
    CollectionReference products = FirebaseFirestore.instance.collection(
      'products',
    );
    await products.add({
      'name': addProductEntity.name,
      'price': addProductEntity.price,
      'description': addProductEntity.description,
      'code': addProductEntity.code,
      'image': addProductEntity.imagePath,
      'isFeaturedItem': addProductEntity.isFeaturedItem,
      'isOrganic': addProductEntity.isOrganic,
      'averageRating': addProductEntity.averageRating,
      'ratingCount': addProductEntity.ratingCount,
      'expirationMonth': addProductEntity.expirationMonth,
      'numOfCalaories': addProductEntity.numOfCalaories,
      'unitAmount': addProductEntity.unitAmount
    });
  }
}
