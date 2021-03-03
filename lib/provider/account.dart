import 'package:expense_tracker/model/aaccount.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel _account = AccountModel(
    amount: 100000.00,
  );
  AccountModel get account => this._account;

  double _expensePrice;
  double get expensePrice => this._expensePrice;
  setExpensePrice(double val) {
    this._expensePrice = val;
  }

  String _expenseName;
  String get expenseName => this._expenseName;
  setExpenseName(String val) {
    this._expenseName = val;
  }

  String _expenseNode;
  String get expenseNode => this._expenseNode;
  setExpenseNode(String val) {
    this._expenseNode = val;
  }

  addAmount() {
    _account.amount += expensePrice;
    notifyListeners();
  }

  minusAmount() {
    _account.amount -= expensePrice;
    notifyListeners();
  }
}
