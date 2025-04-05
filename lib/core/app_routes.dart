
import 'package:fruits_dashboard/features/dash_board/presentation/views/dash_board_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final kOnBoardingView = '/kOnBoadingView';

  static final kLoginview = '/kLoginview';
  static final kRegisterView = '/kRegisterView';
  static final kHomeView = '/kHomeView';

  static final kBestSellerView = '/kBestSellerView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashBoardView(),
      ),
      // GoRoute(
      //   path: kOnBoardingView,
      //   builder: (context, state) => const OnBoardingView(),
      // ),
      // GoRoute(
      //   path: kLoginview,
      //   builder: (context, state) => const LoginView(),
      // ),
      // GoRoute(
      //     path: kRegisterView,
      //     builder: (context, state) => const RegisterView()),
      // GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      // GoRoute(path: kBestSellerView, builder: (context, state) => const BestSellerView()),
    ],
  );
}
