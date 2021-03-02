import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/bottom_navigation_screens/account_overview.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/expense/add_new_record.dart';

class Router {
  static Map<String, Widget Function(BuildContext)> routes = {
    AccountOverviewScreen.routeName: (_) => AccountOverviewScreen(),
    AddNewRecord.routeName: (_) => AddNewRecord(),
  };
}
