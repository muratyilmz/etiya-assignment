import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/space_x_launch_bloc.dart';

class SearchBlocLogic extends StatefulWidget {
  final SpaceXLaunchHasData state;
  const SearchBlocLogic({super.key, required this.state});

  @override
  State<SearchBlocLogic> createState() => _SearchBlocLogicState();
}

class _SearchBlocLogicState extends State<SearchBlocLogic> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceXLaunchBloc, SpaceXLaunchState>(
      builder: (context, state) {
        if (state is SpaceXLaunchHasData) {
          void searchLaunch(String query) {
            var searchLaunchRocket = state.getSpaceXList.where((rocketName) {
              final titleLower = rocketName.name?.toLowerCase();
              final searchLower = query.toLowerCase();
              return titleLower!.contains(searchLower);
            }).toList();

            setState(() {
              query = query;
              searchLaunchRocket = searchLaunchRocket;
            });
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
