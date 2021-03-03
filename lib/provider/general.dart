import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  int _bottomNavigationIndex = 0;
  int get bottomNavigationIndex => this._bottomNavigationIndex;
  set bottomNavigationIndex(int i) {
    _bottomNavigationIndex = i;
    notifyListeners();
  }

  bool _isOverviewVisibility = true;
  bool get isOverviewVisibility => this._isOverviewVisibility;
  void setSOverviewVisibility() {
    _isOverviewVisibility = !_isOverviewVisibility;
    notifyListeners();
  }

  bool _isFirstTimeLogin = true;
  bool get isFirstTimeLogin => this._isFirstTimeLogin;
  void setIsFirstTimeLogin() {
    _isFirstTimeLogin = false;
    notifyListeners();
  }

  int _pieChartTouchedIndex;
  int get pieChartTouchedIndex => this._pieChartTouchedIndex;
  void setPieChartTouchedIndex(int index) {
    print(index);
    _pieChartTouchedIndex = index;
    notifyListeners();
  }
}
