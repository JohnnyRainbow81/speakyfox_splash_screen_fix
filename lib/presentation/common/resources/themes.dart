import 'package:flutter/material.dart';
import 'color_assets.dart';
import 'font_assets.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorAssets.primary,
    backgroundColor: ColorAssets.background,
    scaffoldBackgroundColor: ColorAssets.background,
    fontFamily: FontAssets.primary,
    textTheme: _getApplicationTextTheme(),
    outlinedButtonTheme: _getOutlinedButtonThemeData(),
    elevatedButtonTheme: _getElevatedButtonThemeData(),
    sliderTheme: _getSliderThemeData(),
    inputDecorationTheme: _getInputDecorationTheme(),
    buttonTheme: _getButtonThemeData(), //nearly empty yet
    iconTheme: _getIconThemeData(), 
    primaryIconTheme: _getIconThemeData(),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
    }),
  );
}

TextTheme _getApplicationTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
        fontSize: 96, fontWeight: FontWeight.w300, color: ColorAssets.primary, fontFamily: FontAssets.primary,letterSpacing: -1.5, height: 1),
    headline2: TextStyle(
        fontSize: 60, fontWeight: FontWeight.w300, color: ColorAssets.primary, fontFamily: FontAssets.primary),  //r
    headline3: TextStyle(
        fontSize: 48, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    headline4: TextStyle(
        fontSize: 36, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary),//b
    headline5: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary),//b
    headline6: TextStyle(
        fontSize: 19, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary),//b
    button: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: ColorAssets.primary, fontFamily: FontAssets.primary),//b
    bodyText1: TextStyle(fontSize: 15, color: ColorAssets.primary, fontFamily: FontAssets.primary, fontWeight: FontWeight.w500), //r
    bodyText2: TextStyle(fontSize: 13, color: ColorAssets.primary, fontFamily: FontAssets.primary, fontWeight: FontWeight.w500), //r
    caption: TextStyle(fontSize: 13, color: ColorAssets.primary, fontFamily: FontAssets.primary), //b
    subtitle1: TextStyle(fontSize: 14, color: ColorAssets.primary, fontFamily: FontAssets.primary,fontWeight: FontWeight.w500),//r
    subtitle2: TextStyle(fontSize: 12, color: ColorAssets.primary, fontFamily: FontAssets.primary),//b
    labelMedium: TextStyle(fontSize: 13, color: ColorAssets.grey, fontFamily: FontAssets.primary,fontWeight: FontWeight.w500),//r
  );
}

IconThemeData _getIconThemeData() {
  return const IconThemeData(
    color: ColorAssets.primary,size: 24,
  );
}

OutlinedButtonThemeData _getOutlinedButtonThemeData() {
  return OutlinedButtonThemeData(style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all( 12)),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minimumSize: MaterialStateProperty.all<Size>(const Size(16, 16)),
alignment: Alignment.center,
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(
      width: 1,
      color: ColorAssets.primary
  ))));
}

ButtonThemeData _getButtonThemeData() {
  return const ButtonThemeData(); //TODO buttontheme definieren
}

ElevatedButtonThemeData _getElevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 24)),
    backgroundColor: MaterialStateProperty.all<Color>(ColorAssets.buttonBackgroundActiveColor),
    foregroundColor: MaterialStateProperty.all<Color>(ColorAssets.black),
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

TextStyle getHintTextStyle() {
  return const TextStyle(color: ColorAssets.grey, fontWeight: FontWeight.bold, fontFamily: 'SourceSansProBold');
}

SliderThemeData _getSliderThemeData() {
  return const SliderThemeData(
      activeTrackColor: ColorAssets.sliderActiveTrack,
      inactiveTrackColor: ColorAssets.sliderInactiveTrack,
      thumbColor: ColorAssets.sliderThumbColor);
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    alignLabelWithHint: false,
    // errorStyle: TextStyle(fontSize: 20, color: Colors.red, fontFamily: FontAssets.primary),
    // helperStyle: TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary),
    // floatingLabelStyle:TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary) ,
    // counterStyle: TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary),
    // suffixStyle: TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary),
    // prefixStyle: TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary),
    // labelStyle: TextStyle(fontSize: 20, color: ColorAssets.black, fontFamily: FontAssets.primary),
    hintStyle: getHintTextStyle(),
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
  );
}
