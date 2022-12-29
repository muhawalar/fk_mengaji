import 'package:fk_mengaji/material/themes_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyle {
  static TextStyle title = GoogleFonts.jaldi(
    fontSize: 24,
    color: ColorApp.black,
  );

  static TextStyle heading = GoogleFonts.jaldi(
    fontSize: 20,
    color: ColorApp.black,
  );

  static TextStyle subContent = GoogleFonts.jaldi(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );

  static TextStyle menu = GoogleFonts.jaldi(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );
  static TextStyle titleArticle = GoogleFonts.jaldi(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorApp.black,
  );

  static TextStyle timeOfPray = GoogleFonts.jaldi(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: ColorApp.white,
  );

  static TextStyle place = GoogleFonts.jaldi(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorApp.white,
  );
}
