// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constants/urls.dart';
// import '../extension/theme_extension.dart';
// import '../functions/webview_func.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class LegalInformationBottom extends StatelessWidget {
//   const LegalInformationBottom({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//       child: Text.rich(
//         textAlign: TextAlign.center,
//         TextSpan(
//           children: [
//             TextSpan(
//               text: AppLocalizations.of(context)!.usersLoggedOneloc1,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodySmall
//                   ?.copyWith(color: Theme.of(context).blackAndWhite),
//             ),
//             WidgetSpan(
//               child: InkWell(
//                   onTap: () async {
//                     webViewFunc(MyURLs.privacypolicy, context);
//                   },
//                   child: Text(
//                     AppLocalizations.of(context)!.privacyPoliciy,
//                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         decoration: TextDecoration.underline,
//                         color: Theme.of(context).blackAndWhite),
//                   )),
//             ),
//             TextSpan(
//               text: AppLocalizations.of(context)!.usersLoggedOneloc2,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodySmall
//                   ?.copyWith(color: Theme.of(context).blackAndWhite),
//             ),
//             WidgetSpan(
//               child: InkWell(
//                 onTap: () async {
//                   webViewFunc(MyURLs.terms, context);
//                 },
//                 child: Text(
//                   AppLocalizations.of(context)!.termsAndConditions,
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                       color: Theme.of(context).blackAndWhite),
//                 ),
//               ),
//             ),
//             TextSpan(
//               text: AppLocalizations.of(context)!.usersLoggedOneloc3,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodySmall
//                   ?.copyWith(color: Theme.of(context).blackAndWhite),
//             ),
//           ],
//         ),
//         maxLines: 3,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
// }
