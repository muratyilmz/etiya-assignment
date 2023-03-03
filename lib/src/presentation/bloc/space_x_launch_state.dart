// ignore_for_file: must_be_immutable

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
  List<SpaceXEntities> getSpaceXList;
  SpaceXLaunchHasData(this.getSpaceXList);
}

class SpaceXLaunchError extends SpaceXLaunchState {
  final String message;
  const SpaceXLaunchError({required this.message});
}
