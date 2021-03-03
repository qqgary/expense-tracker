import 'package:expense_tracker/model/category.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/account_overview.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/expense/add_expense.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constant {
  static final List<Widget> bottomNavigationScreen = [
    AccountOverviewScreen(),
    AddExpenseScreen(),
    AccountOverviewScreen(),
  ];

  static final List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Container(),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.plusCircle,
        size: 36,
      ),
      title: Container(),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.pie_chart),
      title: Container(),
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

  static List<CategoryModel> categories = [
    CategoryModel(
      icon: Icons.fastfood,
      color: AppColor.red,
      name: 'Food',
      isExpense: true,
    ),
    CategoryModel(
      icon: FontAwesomeIcons.car,
      color: AppColor.blue,
      name: 'Car',
      isExpense: true,
    ),
    CategoryModel(
      icon: Icons.local_hospital,
      color: AppColor.orange,
      name: 'Health',
      isExpense: true,
    ),
    CategoryModel(
      icon: FontAwesomeIcons.home,
      color: AppColor.yellow,
      name: 'Living',
      isExpense: true,
    ),
    CategoryModel(
      icon: Icons.book,
      color: AppColor.red,
      name: 'Education',
      isExpense: true,
    ),
    CategoryModel(
      icon: FontAwesomeIcons.shieldVirus,
      color: AppColor.red,
      name: 'Insurance',
      isExpense: true,
    ),
    CategoryModel(
      icon: Icons.phone,
      color: AppColor.red,
      name: 'Phone',
      isExpense: true,
    ),
    CategoryModel(
      icon: Icons.pets,
      color: AppColor.orange,
      name: 'Pet',
      isExpense: true,
    ),
    CategoryModel(
      icon: Icons.eject,
      color: AppColor.orange,
      name: 'Others',
      isExpense: true,
    ),
    CategoryModel(
        icon: Icons.attach_money,
        color: AppColor.accentGreen,
        name: 'Income',
        isExpense: false),
  ];
}
