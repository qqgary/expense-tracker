import 'package:expense_tracker/themes/styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxlines;
  final FontStyle fontStype;
  final bool underline;
  final bool isStrikeThrough;
  final bool isTextShadow;
  final bool isTranslate;

  const AppText(this.text,
      {this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.color: Colors.white,
      this.fontStype,
      this.textAlign,
      this.overflow: TextOverflow.ellipsis,
      this.maxlines: 3,
      this.underline: false,
      this.isStrikeThrough: false,
      this.isTextShadow: false,
      this.isTranslate: true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxlines,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? AppFontSize.medium,
        fontWeight: fontWeight,
        fontStyle: fontStype,
        fontFamily: fontFamily,
        decoration: underline
            ? TextDecoration.underline
            : isStrikeThrough ? TextDecoration.lineThrough : null,
        shadows: isTextShadow ? AppTextShadow.normal : null,
      ),
    );
  }
}
