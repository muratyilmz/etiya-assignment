import 'package:etiya_space_x/src/presentation/bloc/space_x_launch_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'core/data/datasources/remote_datasources.dart';
import 'core/data/repositories/space_x_repositories_impl.dart';
import 'core/domain/repositories/space_x_repository.dart';
import 'core/domain/usecases/space_x_launch.dart';
import 'core/network/network_menager.dart';

final injector = GetIt.instance;

Future<void> init() async {
  // bloc
  injector.registerFactory(() => SpaceXLaunchBloc(injector()));

  // usecase
  injector.registerLazySingleton(() => SpaceXLaunch(injector()));

  // repository

  injector.registerLazySingleton<SpaceXRepository>(
    () => SpaceXRemoteDataSourceImpl(remoteDataSource: injector()),
  );

  // data source
  injector.registerLazySingleton<SpaceXRemoteDataSource>(
      () => SpaceXRemoteDataSourceImp(injector()));

  //network
  injector.registerLazySingleton(() => NetworkManager());

  await dotenv.load(fileName: '.env');
}
