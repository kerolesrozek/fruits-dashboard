import 'package:fruits_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_dashboard/features/dash_board/presentation/views/dash_board_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final kAddProductView = '/add_product_view';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DashBoardView()),

      GoRoute(
        path: kAddProductView,
        builder: (context, state) => const AddProductView(),
      ),
    ],
  );
}
