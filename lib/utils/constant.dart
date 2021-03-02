import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/account_overview.dart';

class Constant {
  static final List<Widget> bottomNavigationScreen = [
    AccountOverviewScreen(),
    AccountOverviewScreen(),
    AccountOverviewScreen(),
  ];

  static final List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: AppText('', fontSize: AppFontSize.small),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.newspaper,
      ),
      title: AppText(
        '',
        fontSize: AppFontSize.small,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      title: AppText('', fontSize: AppFontSize.small),
    ),
  ];

  static Color darkPrimary = Color(0xff1E1E1E);
  static Color lightAccent = Colors.orangeAccent;
  static Color darkAccent = Colors.orangeAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Color(0xff1E1E1E);
  static Color ratingBG = Colors.yellow[600];
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
