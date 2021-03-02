import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralProvider extends ChangeNotifier {
  int _bottomNavigationIndex = 0;
  int get bottomNavigationIndex => this._bottomNavigationIndex;
  set bottomNavigationIndex(int i) {
    _bottomNavigationIndex = i;
    notifyListeners();
  }
}
