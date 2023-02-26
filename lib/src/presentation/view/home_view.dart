import 'package:etiya_space_x/src/presentation/widget/home_bloc.dart';
import 'package:etiya_space_x/src/presentation/widget/home_content_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../config/color/app_color.dart';
import '../../core/components/appbar/custom_appbar.dart';

import 'package:flutter/material.dart';

import '../../core/components/card/custom_card.dart';
import '../../core/components/card/custom_card_details.dart';
import '../bloc/space_x_launch_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<SpaceXLaunchBloc>().add(const GetAllSpaceXList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTones.title,
          title: const CustomAppBar(title: 'Find Your Launcher!'),
        ),
        body: HomeBlocWidget());
  }

  ListView _listedItems() {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return seperatorSize();
      },
      itemBuilder: (context, index) {
        return CustomCardWidget(
            child: CardDetails(
          playerImage: 'https://i.imgur.com/kjrv8fF.png',
          onTapIcon: () => print('object'),
          playerDescription: 'asd',
        ));
      },
    );
  }

  // Widget content() {
  //   return BlocBuilder<SpaceXLaunchBloc, SpaceXLaunchState>(
  //     builder: (context, state) {
  //       if (state is SpaceXLaunchEmpty) {
  //         Container(
  //           height: 300,
  //           width: 200,
  //           color: Colors.red,
  //         );
  //       } else if (state is SpaceXLaunchError) {
  //         Container(
  //           height: 300,
  //           width: 200,
  //           color: Colors.red,
  //         );
  //         const Text('Error State');
  //       } else if (state is SpaceXLaunchHasData) {
  //         Center(
  //             child: Text(
  //           '${state.getSpaceXList.length}',
  //         ));
  //         print('${state.getSpaceXList.length}');

  //         // Text('${state.getAllNeed[].data['age']}');
  //         Container(
  //           height: 200,
  //           width: 20,
  //           color: Colors.yellow,
  //         );
  //       }
  //       return const SizedBox.shrink();
  //     },
  //   );
  // }

  Widget seperatorSize() => SizedBox(
        height: 1.h,
      );
}

Container _emptyState() {
  return Container(
    color: ColorTones.lightBlue,
    child: const Text('This page is empty'),
  );
}
