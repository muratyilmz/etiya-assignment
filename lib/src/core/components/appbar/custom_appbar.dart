import 'package:animated_search_bar/animated_search_bar.dart';

import 'package:flutter/material.dart';

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
      searchStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(fontSize: 20),
      label: 'Find Your Launcher!',
      cursorColor: ColorTones.snowWhite,
      searchDecoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: ColorTones.snowWhite),
          alignLabelWithHint: true,
          fillColor: ColorTones.lightBlue,
          border: InputBorder.none),
      onChanged: (value) => print('test'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
