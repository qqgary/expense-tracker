import 'package:expense_tracker/themes/styles.dart';
import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius([BorderRadiusGeometry radius]) {
    return ClipRRect(
      borderRadius: radius ?? AppBorderRadius.normal,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }
}
