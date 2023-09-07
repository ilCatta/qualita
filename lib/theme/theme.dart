import 'package:flutter/material.dart';

class Themes {
  // --------------------------------------------------------
  // TEMA CHIARO
  static final light = ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFE9531F),
    appBarTheme: AppBarTheme(),
    textTheme: Typography().black.apply(
          fontFamily: 'OpenSans',
          bodyColor: Colors.black,
        ),
  );

  // --------------------------------------------------------
  // TEMA SCURO
  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Color(0xFFE9531F),
    appBarTheme: AppBarTheme(),
    textTheme: Typography().white.apply(
          fontFamily: 'OpenSans',
          bodyColor: Colors.white,
        ),
  );
}
