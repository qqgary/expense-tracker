import 'package:flutter/material.dart';

double maxHeight(BuildContext context) => MediaQuery.of(context).size.height;

double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;

navigatorPopUp(BuildContext context, Widget child) {
  final begin = Offset(0.0, 1.0);
  final end = Offset.zero;
  final curve = Curves.ease;

  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animate1, animate2) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, ch) =>
          SlideTransition(
        position: animation.drive(tween),
        child: ch,
      ),
    ),
  );
}

fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
