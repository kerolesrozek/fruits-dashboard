import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/check_box_widgte.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_image_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/dash_board/presentation/views/widgets/custom_button.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  late num productPrice;
  late bool isFeatured = false;
  File? productImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (p0) {
                  productName = p0!;
                },
                hintText: 'اسم المنتج',
                inputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (p0) {
                  productPrice = num.parse(p0!);
                },
                hintText: 'السعر',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (p0) {
                  productCode = p0!.toLowerCase();
                },
                hintText: 'كود المنتج',
                inputType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (p0) {
                  productDescription = p0!;
                },
                hintText: 'وصف المنتج',
                inputType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 20),

              CheckBoxWidget(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),

              CustomImageField(
                onFileChanged: (File? value) {
                  productImage = value;
                },
              ),

              SizedBox(height: 20),
              CustomButton(
                title: 'Add Poduct',
                onPressed: () {
                  if (productImage != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('يرجى اختيار صورة المنتج')),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
