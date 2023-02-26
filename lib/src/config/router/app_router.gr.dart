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
    DetailsRouter.name: (routeData) {
      final args = routeData.argsAs<DetailsRouterArgs>(
          orElse: () => const DetailsRouterArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DetailsView(
          key: args.key,
          name: args.name,
          date: args.date,
          details: args.details,
          largeImage: args.largeImage,
        ),
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
        RouteConfig(
          DetailsRouter.name,
          path: '/details',
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

/// generated route for
/// [DetailsView]
class DetailsRouter extends PageRouteInfo<DetailsRouterArgs> {
  DetailsRouter({
    Key? key,
    String? name,
    String? date,
    String? details,
    String? largeImage,
  }) : super(
          DetailsRouter.name,
          path: '/details',
          args: DetailsRouterArgs(
            key: key,
            name: name,
            date: date,
            details: details,
            largeImage: largeImage,
          ),
        );

  static const String name = 'DetailsRouter';
}

class DetailsRouterArgs {
  const DetailsRouterArgs({
    this.key,
    this.name,
    this.date,
    this.details,
    this.largeImage,
  });

  final Key? key;

  final String? name;

  final String? date;

  final String? details;

  final String? largeImage;

  @override
  String toString() {
    return 'DetailsRouterArgs{key: $key, name: $name, date: $date, details: $details, largeImage: $largeImage}';
  }
}
