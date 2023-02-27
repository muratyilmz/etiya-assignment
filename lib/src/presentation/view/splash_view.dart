import 'dart:async';

import 'package:etiya_space_x/src/core/constant/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../config/color/app_color.dart';
import '../../config/router/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _homeRoute() {
    Timer(
      const Duration(
        milliseconds: 1000,
      ),
      () => router.replace(const HomeRouter()),
    );
  }

  @override
  void initState() {
    super.initState();
    _homeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorTones.softGreen,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(7.w),
          child: SvgPicture.asset(
            ImagesConstant.splashLogo,
            height: 40.h,
            width: 40.w,
          ),
        ),
      ),
    );
  }
}
