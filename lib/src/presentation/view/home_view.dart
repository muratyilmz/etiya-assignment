import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/color/app_color.dart';
import '../../core/components/appbar/custom_appbar.dart';
import '../bloc/space_x_launch_bloc.dart';
import '../widget/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

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
          title: const CustomAppBar(
            title: 'Find Your Launcher!',
          ),
        ),
        body: const HomeBlocWidget());
  }
}
