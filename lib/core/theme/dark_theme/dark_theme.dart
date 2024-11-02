// // ignore_for_file: non_constant_identifier_names, unused_element

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../constants/colors.dart';

// String? FONT_FAMILY = 'Roboto';
// FontWeight _bold = FontWeight.w700;
// FontWeight _medium = FontWeight.w500;
// FontWeight _regular = FontWeight.w400;
// final ThemeData _baseDarkTheme = ThemeData(
//   useMaterial3: false,
//   fontFamily: FONT_FAMILY,
//   brightness: Brightness.dark,

//   //!COLORS

//   primaryColor: MyColors.primaryColor,
//   scaffoldBackgroundColor: WidgetColors.scaffoldBackgroundColorDark,
//   // ignore: deprecated_member_use
//   //errorColor: WidgetColors.errorColorDark,

//   //TextFormFieldFocus için
//   colorScheme: const ColorScheme(
//     primary: MyColors.blue2,
//     secondary: WidgetColors.inputDecorationHintTextFocusColorDark,
//     surface: Color(0xffffffff),
//     background: WidgetColors.inputDecorationFocusColorDark,
//     error: WidgetColors.errorMessageColorDark,
//     onPrimary: Color(0xffffffff), //xx
//     onSecondary: Color(0xff000000),
//     onSurface: Color(0xff000000),
//     onBackground: Color(0xffffffff),
//     onError: Color(0xffffffff),
//     brightness: Brightness.dark,
//   ),

//   //!TEXT THEME
//   textTheme: TextTheme(
//     //DISPLAYS
//     displayLarge: TextStyle(
//         fontSize: 57.sp, fontWeight: _bold, color: WidgetColors.textColorDark),
//     displayMedium: TextStyle(
//         fontSize: 45.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),
//     displaySmall: TextStyle(
//         fontSize: 36.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDark),

//     //HEADLINES
//     headlineLarge: TextStyle(
//         fontSize: 32.sp, fontWeight: _bold, color: WidgetColors.textColorDark),
//     headlineMedium: TextStyle(
//         fontSize: 28.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),
//     headlineSmall: TextStyle(
//         fontSize: 24.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDark),

//     //TITLES
//     titleLarge: TextStyle(
//         fontSize: 22.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),
//     titleMedium: TextStyle(
//         fontSize: 16.sp, fontWeight: _bold, color: WidgetColors.textColorDark),
//     titleSmall: TextStyle(
//         fontSize: 14.sp, fontWeight: _bold, color: WidgetColors.textColorDark),

//     //LABELS
//     labelLarge: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),
//     labelMedium: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),
//     labelSmall: TextStyle(
//         letterSpacing: 0,
//         fontSize: 11.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDark),

//     //BODYS
//     bodyLarge: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDark),
//     bodyMedium: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDark),
//     bodySmall: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDark),
//   ),
// );

// final ThemeData darkTheme = _baseDarkTheme.copyWith(
//   cardTheme: const CardTheme(color: WidgetColors.cardColorDark, elevation: 0),

//   //!Elevated Button

//   elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10))),
//           backgroundColor: WidgetColors.elevatedButtonMainColorDark,
//           disabledBackgroundColor:
//               WidgetColors.disabledButtonBackgroundColorDark,
//           disabledForegroundColor:
//               WidgetColors.disabledButtonForegroundColorDark,
//           textStyle: _baseDarkTheme.textTheme.titleMedium)),

//   //!Text Button

//   textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//           textStyle: _baseDarkTheme.textTheme.titleMedium)),

//   //!Appbar

//   appBarTheme: AppBarTheme(
//     toolbarHeight: 60.h,
//     centerTitle: true,
//     titleTextStyle: _baseDarkTheme.textTheme.titleMedium!
//         .copyWith(color: WidgetColors.textColorDark),
//     elevation: 0,
//     color: WidgetColors.appBarColorDark,
//     iconTheme: const IconThemeData(color: WidgetColors.appBarActionsColorDark),
//   ),

//   //!Input

//   inputDecorationTheme: InputDecorationTheme(
//     suffixIconColor: WidgetColors.inputDecorationSuffixiconColorDark,
//     errorStyle: const TextStyle(
//       height: 0,
//       fontSize: 0,
//     ),
//     hintStyle: _baseDarkTheme.textTheme.titleMedium!
//         .copyWith(color: WidgetColors.inputDecorationHinttextColorDark),
//     focusColor: MyColors.darkGrey1,
//     contentPadding:
//         EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
//     fillColor: WidgetColors.inputDecorationFillColorDark,
//     focusedErrorBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       borderSide: BorderSide(color: Colors.red, width: 2),
//     ),
//     errorBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       borderSide: BorderSide(color: Colors.red, width: 2),
//     ),
//     focusedBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       borderSide: BorderSide.none,
//     ),
//     enabledBorder: const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       borderSide: BorderSide.none,
//     ),
//     border: const OutlineInputBorder(
//       borderSide: BorderSide(width: 2),
//       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//     ),
//     disabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         borderSide: BorderSide.none),
//   ),
//   iconTheme: IconThemeData(
//     color: WidgetColors.iconColorDark,
//     opacity: 1,
//     size: 24.h,
//   ),
//   //!Bottom Appbar

//   bottomAppBarTheme: BottomAppBarTheme(
//     height: 60.h,
//     color: WidgetColors.bottomAppBarBackgroundColorDark,
//     elevation: 0,
//   ),

//   //!Tabbar

//   tabBarTheme: TabBarTheme(
//       //    indicatorSize: TabBarIndicatorSize.tab,
//       indicator:
//           const BoxDecoration(color: WidgetColors.tabBarIndicatorColorDark),
//       // const BoxDecoration(),
//       labelStyle: _baseDarkTheme.textTheme.titleMedium,
//       unselectedLabelStyle: _baseDarkTheme.textTheme.labelLarge,
//       labelColor: WidgetColors.tabBarLabelColorDark,
//       unselectedLabelColor: WidgetColors.tabBarLabelColorDark,
//       labelPadding: const EdgeInsets.symmetric(horizontal: 16.0)),

//   //!Floating Action Button

//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//       iconSize: 24.h,
//       elevation: 0,
//       sizeConstraints: BoxConstraints(
//           minHeight: 60.h, minWidth: 60.h, maxHeight: 60.h, maxWidth: 60.h),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(15.r))),
//       backgroundColor:
//           WidgetColors.primaryFloatingActionButtonBackgroundColorDark,
//       foregroundColor:
//           WidgetColors.primaryFloatingActionButtonForegroundColorDark),
// );
