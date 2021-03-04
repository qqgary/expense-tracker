import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = 'home-bottom-navigation';
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GeneralProvider genProvider = Provider.of<GeneralProvider>(context);
    int _currentBottomNavigationIndex = genProvider.bottomNavigationIndex;
    return Scaffold(
      body: IndexedStack(
        index: _currentBottomNavigationIndex,
        children: Constant.bottomNavigationScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.primary,
        selectedIconTheme: IconThemeData(color: AppColor.primary),
        unselectedItemColor: AppColor.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 12,
        currentIndex: _currentBottomNavigationIndex,
        onTap: (int i) => genProvider.bottomNavigationIndex = i,
        items: Constant.bottomNavigationBarItem,
      ),
    );
  }
}
