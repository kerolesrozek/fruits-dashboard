import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/app_routes.dart';
import 'package:fruits_dashboard/features/dash_board/presentation/views/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomButton(
            title: 'Add Product',
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.kAddProductView);
            },
          ),
        ),
      ],
    );
  }
}
