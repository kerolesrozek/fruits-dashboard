import 'package:fruits_dashboard/features/add_product/data/data_sources/images_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/products_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/data/repos_imple/product_repos_imple.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ProductReposImple>(
    ProductReposImple(
      ImagesRemoteDataSourceImple(),
      productsRemoteDataSource: ProductsRemoteDataSourceImple(),
    ),
  );
}
