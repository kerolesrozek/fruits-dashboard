import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/app_routes.dart';

void main() {
  runApp(const FruitsDashBoard());
}
class FruitsDashBoard extends StatelessWidget {
  const FruitsDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
    );
  }
}