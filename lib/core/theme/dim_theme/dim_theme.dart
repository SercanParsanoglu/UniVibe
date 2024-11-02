// // ignore_for_file: non_constant_identifier_names, unused_element

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../constants/colors.dart';

// String? FONT_FAMILY = 'Roboto';
// FontWeight _bold = FontWeight.w700;
// FontWeight _medium = FontWeight.w500;
// FontWeight _regular = FontWeight.w400;
// final ThemeData _baseDimTheme = ThemeData(
//   useMaterial3: false,
//   fontFamily: FONT_FAMILY,
//   brightness: Brightness.dark,

//   //!COLORS

//   primaryColor: MyColors.primaryColor,
//   scaffoldBackgroundColor: WidgetColors.scaffoldBackgroundColorDim,
//   // ignore: deprecated_member_use
//   //errorColor: WidgetColors.errorColorDim,

//   //TextFormFieldFocus için
//   colorScheme: const ColorScheme(
//     primary: MyColors.blue2,
//     secondary: WidgetColors.inputDecorationHintTextFocusColorDim,
//     surface: Color(0xffffffff),
//     background: WidgetColors.inputDecorationFocusColorDim,
//     error: WidgetColors.errorMessageColorDim,
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
//         fontSize: 57.sp, fontWeight: _bold, color: WidgetColors.textColorDim),
//     displayMedium: TextStyle(
//         fontSize: 45.sp, fontWeight: _medium, color: WidgetColors.textColorDim),
//     displaySmall: TextStyle(
//         fontSize: 36.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDim),

//     //HEADLINES
//     headlineLarge: TextStyle(
//         fontSize: 32.sp, fontWeight: _bold, color: WidgetColors.textColorDim),
//     headlineMedium: TextStyle(
//         fontSize: 28.sp, fontWeight: _medium, color: WidgetColors.textColorDim),
//     headlineSmall: TextStyle(
//         fontSize: 24.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDim),

//     //TITLES
//     titleLarge: TextStyle(
//         fontSize: 22.sp, fontWeight: _medium, color: WidgetColors.textColorDim),
//     titleMedium: TextStyle(
//         fontSize: 16.sp, fontWeight: _bold, color: WidgetColors.textColorDim),
//     titleSmall: TextStyle(
//         fontSize: 14.sp, fontWeight: _bold, color: WidgetColors.textColorDim),

//     //LABELS
//     labelLarge: TextStyle(
//         fontSize: 14.sp, fontWeight: _medium, color: WidgetColors.textColorDim),
//     labelMedium: TextStyle(
//         fontSize: 12.sp, fontWeight: _medium, color: WidgetColors.textColorDim),
//     labelSmall: TextStyle(
//         letterSpacing: 0,
//         fontSize: 11.sp,
//         fontWeight: _medium,
//         color: WidgetColors.textColorDim),

//     //BODYS
//     bodyLarge: TextStyle(
//         fontSize: 16.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDim),
//     bodyMedium: TextStyle(
//         fontSize: 14.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDim),
//     bodySmall: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: _regular,
//         color: WidgetColors.textColorDim),
//   ),
// );

// final ThemeData dimTheme = _baseDimTheme.copyWith(
//   cardTheme: const CardTheme(color: WidgetColors.cardColorDim, elevation: 0),

//   //!Elevated Button

//   elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w),
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10))),
//           backgroundColor: WidgetColors.elevatedButtonMainColorDim,
//           disabledBackgroundColor:
//               WidgetColors.disabledButtonBackgroundColorDim,
//           disabledForegroundColor:
//               WidgetColors.disabledButtonForegroundColorDim,
//           textStyle: _baseDimTheme.textTheme.titleMedium)),

//   //!Text Button

//   textButtonTheme: TextButtonThemeData(
//       style:
//           TextButton.styleFrom(textStyle: _baseDimTheme.textTheme.titleMedium)),

//   //!Appbar

//   appBarTheme: AppBarTheme(
//     toolbarHeight: 60.h,
//     centerTitle: true,
//     titleTextStyle: _baseDimTheme.textTheme.titleMedium!
//         .copyWith(color: WidgetColors.textColorDim),
//     elevation: 0,
//     color: WidgetColors.appBarColorDim,
//     iconTheme: const IconThemeData(color: WidgetColors.appBarActionsColorDim),
//   ),

//   //!InputBase

//   inputDecorationTheme: InputDecorationTheme(
//     suffixIconColor: WidgetColors.inputDecorationSuffixIconColorDim,
//     errorStyle: const TextStyle(
//       height: 0,
//       fontSize: 0,
//     ),
//     hintStyle: _baseDimTheme.textTheme.titleMedium!
//         .copyWith(color: WidgetColors.inputDecorationHinttextColorDim),
//     focusColor: WidgetColors.inputDecorationFocusColorDim,
//     contentPadding:
//         EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.w, right: 20.w),
//     fillColor: WidgetColors.inputDecorationFillColorDim,
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
//     color: WidgetColors.iconColorDim,
//     opacity: 1,
//     size: 24.h,
//   ),
//   //!Bottom Appbar

//   bottomAppBarTheme: BottomAppBarTheme(
//     height: 60.h,
//     color: WidgetColors.bottomAppBarBackgroundColorDim,
//     elevation: 0,
//   ),

//   //!Tabbar

//   tabBarTheme: TabBarTheme(
//       //    indicatorSize: TabBarIndicatorSize.tab,
//       indicator:
//           const BoxDecoration(color: WidgetColors.tabBarIndicatorColorDim),
//       // const BoxDecoration(),
//       labelStyle: _baseDimTheme.textTheme.titleMedium,
//       unselectedLabelStyle: _baseDimTheme.textTheme.labelLarge,
//       labelColor: WidgetColors.tabBarLabelColorDim,
//       unselectedLabelColor: WidgetColors.tabBarLabelColorDim,
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
//           WidgetColors.primaryFloatingActionButtonBackgroundColorDim,
//       foregroundColor:
//           WidgetColors.primaryFloatingActionButtonForegroundColorDim),
// );
