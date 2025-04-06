import 'package:flutter/material.dart';
import 'package:fruits_dashboard/features/dash_board/presentation/views/widgets/dash_board_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardViewBody(),
    );
  }
}
