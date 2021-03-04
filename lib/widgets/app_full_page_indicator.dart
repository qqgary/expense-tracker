import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/widgets/app_indicator.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppFullPageIndicator extends StatelessWidget {
  final String text;
  const AppFullPageIndicator({this.text, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(AppCornerRadius.normal),
            ),
            color: Colors.white,
          ),
          child: Container(
            margin: EdgeInsets.all(AppMargin.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppIndicator(),
                AppHeightSizedBox.smallBox,
                AppText(
                  text,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
