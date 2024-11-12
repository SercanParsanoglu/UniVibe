// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:oneloc_business/feature/provider/theme_provider.dart';
// import 'package:provider/provider.dart';

// class CustomIconButton extends StatefulWidget {
//   final String icon;
//   final Color? iconColor;
//   final double? size;
//   final VoidCallback? onPressed;

//   const CustomIconButton({
//     Key? key,
//     required this.icon,
//     this.iconColor,
//     this.size,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   State<CustomIconButton> createState() => _CustomIconButtonState();
// }

// class _CustomIconButtonState extends State<CustomIconButton> {
//   Color? color;
//   Color? iconColor;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, value, child) {
//         return IconButton(
//           highlightColor: Colors.transparent,
//           onPressed: widget.onPressed,
//           icon: widget.icon != ''
//               ? SvgPicture.string(
//                   widget.icon,
//                   height: widget.size,
//                   color: widget.iconColor,
//                 )
//               : const Placeholder(),
//         );
//       },
//     );
//   }
// }
