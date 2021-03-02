import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/bottom_navigation_screens/account_overview.dart';

class Router {
  static Map<String, Widget Function(BuildContext)> routes = {
    AccountOverviewScreen.routeName: (_) => AccountOverviewScreen(),
  };
}
