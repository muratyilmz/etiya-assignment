import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/domain/entities/space_x_entities.dart';
import '../../core/domain/usecases/space_x_launch.dart';

part 'space_x_launch_event.dart';
part 'space_x_launch_state.dart';

class SpaceXLaunchBloc extends Bloc<SpaceXLaunchEvent, SpaceXLaunchState> {
  final SpaceXLaunch _spaceXLaunch;

  SpaceXLaunchBloc(this._spaceXLaunch) : super(SpaceXLaunchInitial()) {
    on<GetAllSpaceXList>((event, emit) async {
      emit(SpaceXLaunchInitial());

      try {
        final result = await _spaceXLaunch.getAllSpaceXList();
        result.fold((fail) => emit(SpaceXLaunchError(message: fail.message)),
            (data) {
          if (data.isEmpty) {
            emit(const SpaceXLaunchEmpty());
          } else {
            emit(SpaceXLaunchHasData(data));
          }
        });
      } on Exception catch (_) {
        emit(const SpaceXLaunchError(message: 'An problem has occured'));
      }
    });
  }
}
