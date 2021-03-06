import 'package:expense_tracker/screens/bottom_navigation_screens/pire_chart.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/bottom_navigation_screens/account_overview.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/expense/add_new_record.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/expense_detail.dart';

class Router {
  static Map<String, Widget Function(BuildContext)> routes = {
    AccountOverviewScreen.routeName: (_) => AccountOverviewScreen(),
    PieChartScreen.routeName: (_) => PieChartScreen(),
    AddNewRecord.routeName: (_) => AddNewRecord(),
    ExpenseDetailScreen.routeName: (_) => ExpenseDetailScreen(),
  };
}
