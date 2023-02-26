import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../config/color/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return _theme.copyWith(
      textTheme: GoogleFonts.interTextTheme(_theme.textTheme),
    );
  }

  static ThemeData get _theme => ThemeData(
      splashColor: ColorTones.backGround,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        toolbarHeight: 7.h,
        elevation: 1,
        centerTitle: true,
      ),
      textTheme: GoogleFonts.openSansTextTheme());
}
