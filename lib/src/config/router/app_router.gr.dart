// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRouter.name,
          path: '/',
        ),
        RouteConfig(
          HomeRouter.name,
          path: '/home',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRouter extends PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [HomeView]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/home',
        );

  static const String name = 'HomeRouter';
}
