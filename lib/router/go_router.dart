import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:testtree/cubit/tree_cubit.dart';
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/google_login_page.dart';
import 'package:testtree/feature/home/setting/views/history_page.dart';
import 'package:testtree/my_home_page.dart';

class AppRouteConstant {
  AppRouteConstant._();

  static const String initial = '/';
  static const String googleLoginPage = '/google-login-page';
  static const String myHomePage = '/my-home-page';
  static const String myHistoryPage = '/my-history-page';

  // Nested Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}

class AppRoutes {
  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  AppRoutes._internal();

  GoRouter router = GoRouter(
    initialLocation: AppRouteConstant.initial,
    navigatorKey: AppRouteConstant.navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteConstant.initial,
        builder: (BuildContext context, GoRouterState state) {
          return GoogleLoginPage();
        },
      ),
      GoRoute(
        path: AppRouteConstant.myHomePage,
        builder: (BuildContext context, GoRouterState state) {
          return MyHomePage();
        },
      ),
      GoRoute(
        path: AppRouteConstant.myHistoryPage,
        builder: (BuildContext context, GoRouterState state) {
          final TreeCubit treeCubit = getIt.get();
          return BlocProvider.value(value: treeCubit, child: HistoryPage());
        },
      ),
    ],
  );
}
