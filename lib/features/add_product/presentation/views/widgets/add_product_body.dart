import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_form.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(child: AddProductForm()),
    );
  }
}