import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  double _sumAmount = 0;
  double get sumAmount => this._sumAmount;

  List<ExpenseModel> _expenses = List<ExpenseModel>();
  List<ExpenseModel> get expenses => this._expenses;

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

  addAmount(ExpenseModel expense) {
    _sumAmount += expensePrice;
    _expenses.add(expense);
    notifyListeners();
  }

  minusAmount(ExpenseModel expense) {
    _sumAmount -= expensePrice;
    _expenses.add(expense);
    notifyListeners();
  }
}
