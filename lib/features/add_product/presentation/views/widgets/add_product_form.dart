import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruits_dashboard/features/add_product/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/check_box_widgte.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_image_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_dashboard/features/add_product/presentation/views/widgets/is_organic_widget.dart';
import 'package:fruits_dashboard/features/dash_board/presentation/views/widgets/custom_button.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController expirationMonthController = TextEditingController();
  TextEditingController unitAmountController = TextEditingController();
  TextEditingController numOfCalaoriesController = TextEditingController();

  late num productPrice;
  late bool isFeatured = false;
  File? productImage;
  late int expirationMonth, unitAmount, numOfCalaories;
  bool isorganic = false;

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productCodeController.dispose();
    productDescriptionController.dispose();
    expirationMonthController.dispose();
    unitAmountController.dispose();
    numOfCalaoriesController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          productCodeController.clear();
          productDescriptionController.clear();
          productPriceController.clear();
          productNameController.clear();
          expirationMonthController.clear();
          numOfCalaoriesController.clear();
          unitAmountController.clear();
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextFormField(
              controller: productNameController,
              onSaved: (p0) {
                productName = p0!;
              },
              hintText: 'productName',
              inputType: TextInputType.name,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: productPriceController,
              onSaved: (p0) {
                productPrice = num.parse(p0!);
              },
              hintText: 'productPrice',
              inputType: TextInputType.number,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: productCodeController,
              onSaved: (p0) {
                productCode = p0!.toLowerCase();
              },
              hintText: 'productCode',
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              hintText: 'expirationMonth',
              inputType: TextInputType.number,
              onSaved: (p0) {
                expirationMonth = int.parse(p0!);
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              inputType: TextInputType.number,
              hintText: 'unitAmount',
              onSaved: (p0) {
                unitAmount = int.parse(p0!);
              },
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              inputType: TextInputType.number,
              hintText: 'numOfCalaories',
              onSaved: (p0) {
                numOfCalaories = int.parse(p0!);
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: productDescriptionController,
              onSaved: (p0) {
                productDescription = p0!;
              },
              hintText: 'productDescription',
              inputType: TextInputType.text,
              maxLines: 5,
            ),
            SizedBox(height: 20),

            IsOrganicWidget(
              onChanged: (value) {
                isorganic = value;
              },
            ),

            SizedBox(height: 20),

            CheckBoxWidget(
              onChanged: (value) {
                isFeatured = value;
              },
            ),
            SizedBox(height: 20),
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
                    BlocProvider.of<AddProductCubit>(context).addProduct(
                      addProductEntity: AddProductEntity(
                        productImage!,
                        name: productName,
                        description: productDescription,
                        code: productCode,
                        price: productPrice,
                        isFeaturedItem: isFeatured,
                        expirationMonth: expirationMonth,
                        isOrganic: isorganic,
                        unitAmount: unitAmount,
                        numOfCalaories: numOfCalaories,
                        // ratingCount: null,
                        // averageRating: null,
                      ),
                    );
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
    );
  }
}
