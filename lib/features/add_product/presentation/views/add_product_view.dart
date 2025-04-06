import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('ضيف المنتج'), centerTitle: true),
      body: SafeArea(child: AddProductViewBody()),
    );
  }
}
