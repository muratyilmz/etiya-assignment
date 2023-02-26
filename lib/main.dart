// ignore_for_file: invalid_use_of_internal_member

import 'package:auto_route/auto_route.dart';

import 'package:etiya_space_x/src/core/theme/app_theme.dart';
import 'package:etiya_space_x/src/presentation/bloc/space_x_launch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'src/config/router/app_router.dart';
import 'src/injector.dart' as di;

Future<void> main() async {
  //TODO
  // TODO NETWORK MENAGER
  //TODO PULL TO REFRESH
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return const MyApp();
      },
    ),
  );
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.injector<SpaceXLaunchBloc>()),
      ],
      child: MaterialApp.router(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        title: 'Etiya Space X',
        theme: AppTheme.theme,
        routerDelegate: router.delegate(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        routeInformationParser: router.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
