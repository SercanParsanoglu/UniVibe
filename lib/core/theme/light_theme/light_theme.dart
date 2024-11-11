// ignore_for_file: non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

String? FONT_FAMILY = 'Roboto';
FontWeight _bold = FontWeight.w700;
FontWeight _medium = FontWeight.w500;
FontWeight _regular = FontWeight.w400;
final ThemeData _baseLightTheme = ThemeData(
  useMaterial3: false,
  fontFamily: FONT_FAMILY,
  brightness: Brightness.light,

  //!COLORS

  primaryColor: WidgetColors.primaryColor,
  scaffoldBackgroundColor: WidgetColors.scaffoldColor,
  // ignore: deprecated_member_use
  //errorColor: WidgetColors.errorColorLight,

  //TextFormFieldFocus için
  colorScheme: const ColorScheme(
    primary: WidgetColors.primaryColor,
    secondary: MyColors.teal2,
    surface: Color(0xffffffff),
    error: WidgetColors.errorColor,
    onPrimary: Color(0xffffffff), //xx
    onSecondary: Color(0xff000000),
    onSurface: Color(0xff000000),
    onError: Color(0xffffffff),
    brightness: Brightness.light,
  ),

  //!TEXT THEME
  textTheme: TextTheme(
    //DISPLAYS
    displayLarge: TextStyle(
        fontSize: 57.sp, fontWeight: _bold, color: WidgetColors.textColorLight),
    displayMedium: TextStyle(
        fontSize: 45.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),
    displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: _regular,
        color: WidgetColors.textColorLight),

    //HEADLINES
    headlineLarge: TextStyle(
        fontSize: 32.sp, fontWeight: _bold, color: WidgetColors.textColorLight),
    headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),
    headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: _regular,
        color: WidgetColors.textColorLight),

    //TITLES
    titleLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),
    titleMedium: TextStyle(
        fontSize: 16.sp, fontWeight: _bold, color: WidgetColors.textColorLight),
    titleSmall: TextStyle(
        fontSize: 14.sp, fontWeight: _bold, color: WidgetColors.textColorLight),

    //LABELS
    labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),
    labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),
    labelSmall: TextStyle(
        letterSpacing: 0,
        fontSize: 11.sp,
        fontWeight: _medium,
        color: WidgetColors.textColorLight),

    //BODYS
    bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: _regular,
        color: WidgetColors.textColorLight),
    bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: _regular,
        color: WidgetColors.textColorLight),
    bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: _regular,
        color: WidgetColors.textColorLight),
  ),
);

final ThemeData lightTheme = _baseLightTheme.copyWith(
  cardTheme: const CardTheme(color: WidgetColors.cardColorLight, elevation: 0),

  //!Elevated Button

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: WidgetColors.elevatedButtonMainColorLight,
          disabledBackgroundColor:
              WidgetColors.disabledButtonBackgroundColorLight,
          disabledForegroundColor:
              WidgetColors.disabledButtonForegroundColorLight,
          textStyle: _baseLightTheme.textTheme.titleMedium)),

  //!Text Button

  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: _baseLightTheme.textTheme.titleMedium)),

  //!Appbar

  appBarTheme: AppBarTheme(
    toolbarHeight: 60.h,
    centerTitle: true,
    titleTextStyle: _baseLightTheme.textTheme.titleMedium!
        .copyWith(color: WidgetColors.textColorLight),
    elevation: 0,
    color: WidgetColors.appBarColorLight,
    iconTheme: const IconThemeData(color: WidgetColors.appBarActionsColorLight),
  ),

  //!InputBase

  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: WidgetColors.inputDecorationSuffixIconColorLight,
    // errorStyle: const TextStyle(
    //   height: 0,
    //   fontSize: 0,
    // ),
    hintStyle: _baseLightTheme.textTheme.labelLarge!
        .copyWith(color: WidgetColors.inputDecorationHintTextColorLight),
    focusColor: WidgetColors.inputDecorationFocusColorLight,
    contentPadding:
        EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
    fillColor: WidgetColors.inputDecorationFillColorLight,
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none,
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
  ),
  iconTheme: IconThemeData(
    color: WidgetColors.iconColorLight,
    opacity: 1,
    size: 24.h,
  ),
  //!Bottom Appbar

  bottomAppBarTheme: BottomAppBarTheme(
    height: 60.h,
    color: WidgetColors.bottomAppBarBackgroundColorLight,
    elevation: 0,
  ),

  //!Tabbar

  tabBarTheme: TabBarTheme(
      //    indicatorSize: TabBarIndicatorSize.tab,
      indicator:
          const BoxDecoration(color: WidgetColors.tabBarIndicatorColorLight),
      // const BoxDecoration(),
      labelStyle: _baseLightTheme.textTheme.titleMedium,
      unselectedLabelStyle: _baseLightTheme.textTheme.labelLarge,
      labelColor: WidgetColors.tabBarLabelColorLight,
      unselectedLabelColor: WidgetColors.tabBarLabelColorLight,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16.0)),

  //!Floating Action Button

  floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 24.h,
      elevation: 0,
      sizeConstraints: BoxConstraints(
          minHeight: 60.h, minWidth: 60.h, maxHeight: 60.h, maxWidth: 60.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
      backgroundColor:
          WidgetColors.primaryFloatingActionButtonBackgroundColorLight,
      foregroundColor:
          WidgetColors.primaryFloatingActionButtonForegroundColorLight),
);
