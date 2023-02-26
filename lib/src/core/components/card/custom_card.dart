import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/color/app_color.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21.h,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: ColorTones.backGround,
          semanticContainer: true,
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: child),
    );
  }
}
