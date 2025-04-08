
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_body.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBuilder extends StatefulWidget {
  const AddProductViewBodyBuilder({super.key});

  @override
  State<AddProductViewBodyBuilder> createState() =>
      _AddProductViewBodyBuilderState();
}

class _AddProductViewBodyBuilderState extends State<AddProductViewBodyBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (BuildContext context, AddProductState state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('تم اضافة المنتج بنجاح')));
        }
        if (state is AddProductFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading ? true : false,
          child: AddProductBody(),
        );
      },
    );
  }
}


