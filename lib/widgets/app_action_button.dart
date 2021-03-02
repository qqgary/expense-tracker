import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class AppActionButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;
  final Color fontColor;
  final double fontSize;
  final bool isMaxSize;
  final Function function;
  const AppActionButton({
    @required this.title,
    @required this.function,
    this.margin,
    this.fontColor: Colors.white,
    this.isMaxSize: false,
    this.fontSize: 18,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMaxSize ? maxWidth(context) : null,
      child: RaisedButton(
        color: AppColor.primary,
        onPressed: function,
        child: Container(
          margin: margin ?? EdgeInsets.symmetric(vertical: 14),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: fontColor,
            ),
          ),
        ),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
