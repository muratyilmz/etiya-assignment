part of 'space_x_launch_bloc.dart';

abstract class SpaceXLaunchState extends Equatable {
  const SpaceXLaunchState();

  @override
  List<Object> get props => [];
}

class SpaceXLaunchInitial extends SpaceXLaunchState {}

class SpaceXLaunchEmpty extends SpaceXLaunchState {
  const SpaceXLaunchEmpty();
}

class SpaceXLaunchHasData extends SpaceXLaunchState {
  final List<SpaceXEntities> getSpaceXList;
  const SpaceXLaunchHasData(this.getSpaceXList);
}

class SpaceXLaunchError extends SpaceXLaunchState {
  final String message;
  const SpaceXLaunchError({required this.message});
}
