import 'package:etiya_space_x/src/config/color/app_color.dart';
import 'package:etiya_space_x/src/presentation/bloc/space_x_launch_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'home_content_widget.dart';

class HomeBlocWidget extends StatelessWidget {
  const HomeBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceXLaunchBloc, SpaceXLaunchState>(
      builder: (context, state) {
        if (state is SpaceXLaunchInitial) {
          // return const SizedBox.shrink();
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (state is SpaceXLaunchError) {
          return Center(child: Text(state.message));
        } else if (state is SpaceXLaunchHasData) {
          return HomeContentWidget(state: state);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
