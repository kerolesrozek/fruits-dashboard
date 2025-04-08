import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/core/get_it_sevice.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/images_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/data/data_sources/products_remote_data_source.dart';
import 'package:fruits_dashboard/features/add_product/data/repos_imple/image_repos_imple.dart';
import 'package:fruits_dashboard/features/add_product/data/repos_imple/product_repos_imple.dart';
import 'package:fruits_dashboard/features/add_product/domain/usecases/add_product_usecase.dart';
import 'package:fruits_dashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('ضيف المنتج'), centerTitle: true),
      body: SafeArea(
        child: BlocProvider(
          create:
              (context) => AddProductCubit(
                AddProductUsecase(
                  productsRepos: getIt.get<ProductReposImple>(),
                ),
              ),
          child: AddProductViewBodyBuilder(),
        ),
      ),
    );
  }
}
