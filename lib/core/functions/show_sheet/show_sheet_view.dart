import 'package:flutter/material.dart';


/// The function `showSheetView` displays a modal bottom sheet with a given child widget in a Flutter
/// app.
/// 
 
/// Args:
///   context (BuildContext): The `context` parameter in Flutter represents the location of a widget
/// within the widget tree. It provides access to various properties and methods related to the widget's
/// build context, such as theme, media queries, and navigation. It is typically required when creating
/// or showing widgets within a build method or callback functions
///   childPage (Widget): The `childPage` parameter in the `showSheetView` function is a `Widget` that
/// represents the content that will be displayed within the modal bottom sheet when it is shown. This
/// `childPage` widget can be any custom widget or a combination of widgets that you want to display
/// within the
/// 
 
/// Returns:
///   The `childPage` widget is being returned inside the `builder` function of the
/// `showModalBottomSheet` method.

void showSheetView(BuildContext context, Widget childPage) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.black.withOpacity(0),
    context: context,
    builder: (context) {
      return childPage;
    },
  );
}
