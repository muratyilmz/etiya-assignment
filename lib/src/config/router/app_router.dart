import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../../presentation/view/home_view.dart';
import '../../presentation/view/splash_view.dart';
part 'app_router.gr.dart';

/// `AppRouter` is a class that extends `_$AppRouter`
/// and is used to generate a `Router` object
@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashView,
      initial: true,
    ),
    AutoRoute(
      path: '/home',
      name: 'HomeRouter',
      page: HomeView,
    ),
  ],
)

/// `AppRouter` is a class that extends `_`
/// and is used to generate a `Router` object
class AppRouter extends _$AppRouter {}
