import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static Color orange = const Color(0xfffd8e2c);
  static Color gray = const Color(0xffeaeae8);

  static Color grayDarker = const Color(0xff9d8f8f);
  static Color white = const Color(0xfff6f4f3);
  static Color black = const Color(0xff363231);

  static TextStyle h1 = GoogleFonts.dancingScript(
    textStyle: const TextStyle(
      fontSize: 52.0,
      fontWeight: FontWeight.bold,
    )
  );

  static TextStyle h2 = GoogleFonts.dancingScript(
      textStyle: const TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      )
  );

  static TextStyle h3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.w500,
      )
  );

  static TextStyle b1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      )
  );

  static TextStyle b2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      )
  );

  static TextStyle b3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 14.5,
        fontWeight: FontWeight.normal,
      )
  );

  static TextStyle c1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      )
  );
}

