import 'package:flutter/material.dart';

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
