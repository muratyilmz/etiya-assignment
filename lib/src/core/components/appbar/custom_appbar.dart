import 'package:animated_search_bar/animated_search_bar.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../config/color/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedSearchBar(
      labelStyle: TextStyle(fontSize: 20),
      label: 'Find Your Launcher!',
      cursorColor: ColorTones.snowWhite,
      searchDecoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: ColorTones.snowWhite),
          alignLabelWithHint: true,
          fillColor: ColorTones.lightBlue,
          border: InputBorder.none),
      onChanged: (value) => print('asd'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
