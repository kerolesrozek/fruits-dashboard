import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/app_routes.dart';
import 'package:fruits_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FruitsDashBoard());
}

class FruitsDashBoard extends StatelessWidget {
  const FruitsDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}
