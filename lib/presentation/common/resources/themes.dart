import 'dart:ui';

import 'package:flutter/material.dart';
import 'color_assets.dart';
import 'font_assets.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorAssets.primary,
    backgroundColor: ColorAssets.bgBlueLight,
    scaffoldBackgroundColor: ColorAssets.background,
    fontFamily: FontAssets.primary,
    textTheme: _getApplicationTextTheme(),
    outlinedButtonTheme: _getOutlinedButtonThemeData(),
    elevatedButtonTheme: _getElevatedButtonThemeData(),
    sliderTheme: _getSliderThemeData(),
    inputDecorationTheme: _getInputDecorationTheme(),
    buttonTheme: _getButtonThemeData(), //nearly empty yet
    textButtonTheme: _getTextButtonTheme(),
    iconTheme: _getIconThemeData(),
    bottomSheetTheme: _getBottomSheetTheme(),
    //primaryIconTheme: _getIconThemeData(),
    cardTheme: _getCardTheme(),
    appBarTheme: _getAppBarTheme(),
    errorColor: ColorAssets.error,
    hintColor: ColorAssets.lightGrey,
    indicatorColor: ColorAssets.primary,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(), //Another one on Android?
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

TextTheme _getApplicationTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        color: ColorAssets.primary,
        fontFamily: FontAssets.primary,
        letterSpacing: -1.5,
        height: 1),
    headline2: TextStyle(
        fontSize: 54, fontWeight: FontWeight.w300, color: ColorAssets.primary, fontFamily: FontAssets.primary), //r
    headline3: TextStyle(
        fontSize: 42, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    headline4: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    headline5: TextStyle(
        fontSize: 23, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    headline6: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    bodyText1: TextStyle(
        fontSize: 15, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary, fontWeight: FontWeight.w500), //r
    bodyText2: TextStyle(
        fontSize: 13, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary, fontWeight: FontWeight.w500), //r
    caption: TextStyle(fontSize: 13, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    subtitle1: TextStyle(
        //Used for TextInput, don't know why
        fontSize: 16,
        color: ColorAssets.primary,
        fontFamily: FontAssets.primary,
        fontWeight: FontWeight.w500), //r
    subtitle2: TextStyle(fontSize: 12, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    labelMedium: TextStyle(
        fontSize: 13, color: ColorAssets.midGrey, fontFamily: FontAssets.primary, fontWeight: FontWeight.w500), //r
  );
}

AppBarTheme _getAppBarTheme() {
  return const AppBarTheme(
    backgroundColor: ColorAssets.lightest,
    elevation: 0,
  );
}

CardTheme _getCardTheme() {
  return const CardTheme(
      elevation: 20,
      color: ColorAssets.lightest,
      shadowColor: ColorAssets.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))));
}

IconThemeData _getIconThemeData() {
  return const IconThemeData(
    color: ColorAssets.error, //debug color!
    size: 24,
  );
}

OutlinedButtonThemeData _getOutlinedButtonThemeData() {
  return OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(const Size(16, 16)),
          alignment: Alignment.center,
          side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 1, color: ColorAssets.primary))));
}

ButtonThemeData _getButtonThemeData() {
  return const ButtonThemeData(
    buttonColor: ColorAssets.primary,
  ); //TODO buttontheme definieren
}

TextButtonThemeData _getTextButtonTheme() => TextButtonThemeData(style: _getTextButtonStyle());

ButtonStyle _getTextButtonStyle() {
  return ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
    foreground: Paint()..color = ColorAssets.primary,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    decorationColor: ColorAssets.primary,
  )));
}

ElevatedButtonThemeData _getElevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 24)),
    minimumSize: MaterialStateProperty.all<Size>(Size(200, 48)),
    shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32)))),
    backgroundColor: MaterialStateProperty.all<Color>(ColorAssets.primary),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled) || states.contains(MaterialState.error)) {
        return ColorAssets.lightest.withOpacity(0.5);
      }
    }),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) return ColorAssets.buttonHoveredColor;
        if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
          return ColorAssets.buttonPressedColor;
        }
        return null; // Defer to the widget's default.
      },
    ),
  ));
}

ButtonStyle _getButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 0)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(
      width: 0,
    )),
    minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(18)),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );
}

SliderThemeData _getSliderThemeData() {
  return const SliderThemeData(
      activeTrackColor: ColorAssets.sliderActiveTrack,
      inactiveTrackColor: ColorAssets.sliderInactiveTrack,
      thumbColor: ColorAssets.sliderThumbColor);
}

BottomSheetThemeData _getBottomSheetTheme() {
  return const BottomSheetThemeData(backgroundColor: Colors.transparent);
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    alignLabelWithHint: false,
    errorStyle: const TextStyle(fontSize: 13, color: ColorAssets.error, fontFamily: FontAssets.primary, height: 1.0),
    helperStyle: const TextStyle(fontSize: 20, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary),
    floatingLabelStyle: const TextStyle(fontSize: 20, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary),
    counterStyle: const TextStyle(fontSize: 20, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary),
    suffixStyle: const TextStyle(fontSize: 20, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary),
    prefixStyle: const TextStyle(
      fontSize: 15,
      color: ColorAssets.copyTextGrey,
      fontFamily: FontAssets.primary,
    ),
    labelStyle: const TextStyle(fontSize: 20, color: ColorAssets.copyTextGrey, fontFamily: FontAssets.primary),
    hintStyle: const TextStyle(fontSize: 15, color: ColorAssets.darkGrey, fontWeight: FontWeight.normal),
    prefixIconColor: ColorAssets.primary,
    fillColor: ColorAssets.lightest,
    filled: true,
    focusColor: ColorAssets.error, //error color = debug only! change!
    iconColor: ColorAssets.bgBlueLight, errorMaxLines: 2,
    suffixIconColor: ColorAssets.markupGreen, 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: ColorAssets.primary, width: 1.6)),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: ColorAssets.footerBlue, width: 2.4)),
    errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: ColorAssets.error, width: 1.2)),
    focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: ColorAssets.error, width: 1.6)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
  );
}
