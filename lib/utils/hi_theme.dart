import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HiTheme {
  static const _lightFillColor = Color(0xffffffff);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: 'NotoSansKR',
      // textTheme: _textTheme.apply(
      //     displayColor: Color(0xff343434), fontFamily: GoogleFonts
      //     .roboto()
      //     .fontFamily),
      // Matches manifest.json colors and background color.
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      backgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme().copyWith(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        )
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary,),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      buttonTheme: ButtonThemeData(
        disabledColor: Color(0x33000000),
      ),
      disabledColor: Colors.white,
      dividerColor: Color(0xffdbdbdb),
      dividerTheme: DividerThemeData(
        thickness: 1.0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.primary
      ),

    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
      primary: Color(0xffFF8F67),
      primaryVariant: Color(0xffFF8F67),
      secondary: Color(0xffebeeff),
      secondaryVariant: Color(0xffd3deff),
      surface: Colors.white,
      background: Color(0xffF5F6FA),
      error: Color(0xffb00020),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light);

  static final TextTheme _textTheme = Typography.blackCupertino
      .apply(fontFamily: 'NotoSansKR');
}
