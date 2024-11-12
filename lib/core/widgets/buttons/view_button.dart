// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:oneloc_business/core/constants/colors.dart';
// import 'package:oneloc_business/core/constants/icons.dart';
// import 'package:oneloc_business/core/extension/theme_extension.dart';

// import '../../functions/custom_snackbar.dart';

// /// The `ViewButton` class is a Dart widget that represents a button with customizable text, icon, and subtitle, and handles network connectivity checks before executing an `onPressed` callback.

// class ViewButton extends StatelessWidget {
//   final bool? networkCheck;
//   final String btnText;
//   final String? btnText2;
//   final IconData? iconData;
//   final String? btnIcon;
//   final String? btnSubTitle;
//   final String? btnSubTitle2;
//   final VoidCallback? onPressed;
//   final Color? color;
//   final Color? iconColor;

//   const ViewButton({
//     Key? key,
//     this.networkCheck = false,
//     required this.btnText,
//     this.btnText2,
//     this.iconData,
//     this.btnIcon,
//     this.btnSubTitle,
//     this.btnSubTitle2,
//     required this.onPressed,
//     this.color,
//     this.iconColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () async {
//           await _onPressedButton(context);
//         },
//         child: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).viewButtonBackgorundColor,
//           ),
//           child: btnSubTitle != null
//               ? Padding(
//                   padding: EdgeInsets.only(
//                     left: 20.0.w,
//                     right: 10.0.w,
//                     top: 12.0.h,
//                     bottom: 8.0.h,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       btnText2 == null
//                           ? Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Padding(
//                                     padding: EdgeInsets.only(right: 10.0.w),
//                                     child: Text(
//                                       btnText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                 ),
//                                 btnIcon != null
//                                     ? btnIcon != ''
//                                         ? SvgPicture.string(btnIcon!,
//                                             width: 18.sp,
//                                             color: iconColor ??
//                                                 Theme.of(context)
//                                                     .iconTheme
//                                                     .color)
//                                         : const Placeholder()
//                                     : Icon(iconData,
//                                         size: 18.sp,
//                                         color: iconColor ??
//                                             Theme.of(context).iconTheme.color),
//                               ],
//                             )
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       btnText,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall,
//                                     ),
//                                     Text(
//                                       btnText2!,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall!
//                                           .copyWith(color: color),
//                                     ),
//                                   ],
//                                 ),
//                                 btnIcon != null
//                                     ? btnIcon != ''
//                                         ? SvgPicture.string(btnIcon!,
//                                             width: 18.sp,
//                                             color: iconColor ??
//                                                 Theme.of(context)
//                                                     .iconTheme
//                                                     .color)
//                                         : const Placeholder()
//                                     : Icon(iconData,
//                                         size: 18.sp,
//                                         color: iconColor ??
//                                             Theme.of(context).iconTheme.color),
//                               ],
//                             ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 34.0.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               btnSubTitle!,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .labelMedium!
//                                   .copyWith(
//                                     color: Theme.of(context).brightness ==
//                                             Brightness.light
//                                         ? WidgetColors.webViewSubTitleColorLight
//                                         : WidgetColors.webViewSubTitleColorDim,
//                                   ),
//                               maxLines: 3,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             if (btnSubTitle2 != null) ...[
//                               Padding(
//                                 padding: EdgeInsets.only(top: 10.0.w),
//                                 child: Row(
//                                   children: [
//                                     MyIcons().iconsCheck != null
//                                         ? SvgPicture.string(
//                                             MyIcons().iconsCheck!,
//                                             width: 18.sp,
//                                             color: color)
//                                         : const Placeholder(),
//                                     Text(
//                                       " $btnSubTitle2",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium!
//                                           .copyWith(
//                                             color: color,
//                                           ),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ]
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : Padding(
//                   padding: EdgeInsets.only(top: 12.0.h, bottom: 12.0.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 20.0.w),
//                           child: Text(
//                             btnText,
//                             style: color == null
//                                 ? Theme.of(context).textTheme.titleSmall
//                                 : Theme.of(context)
//                                     .textTheme
//                                     .titleSmall
//                                     ?.copyWith(color: color),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//                         child: btnIcon != null
//                             ? btnIcon != ''
//                                 ? SvgPicture.string(btnIcon!,
//                                     width: 18.sp,
//                                     color: iconColor ??
//                                         Theme.of(context).iconTheme.color)
//                                 : const Placeholder()
//                             : Icon(iconData,
//                                 size: 18.sp,
//                                 color: iconColor ??
//                                     Theme.of(context).iconTheme.color),
//                       ),
//                     ],
//                   ),
//                 ),
//         ));
//   }

//   _onPressedButton(BuildContext context) async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none && networkCheck!) {
//       // ignore: use_build_context_synchronously
//       customSnackBar(
//           context: context,
//           onPressed: () async {
//             await _onPressedButton(context);
//           });
//     } else {
//       onPressed!();
//     }
//   }
// }
