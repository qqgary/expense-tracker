import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/model/pie_chart.dart';
import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  double _sumAmount = 0;
  double get sumAmount => this._sumAmount;

  List<ExpenseModel> _expenses = List<ExpenseModel>();
  List<ExpenseModel> get expenses => this._expenses;

  List<double> _pieChartExpenses = List<double>();
  List<double> get pieChartExpenses => this._pieChartExpenses;
  double _totalPieExpenses = 0.00;
  double get totalPieExpenses => this._totalPieExpenses;

  List<double> _pieChartIncome = List<double>();
  List<double> get pieChartIncome => this._pieChartIncome;
  double _totalPieIncome = 0.00;
  double get totalPieIncome => this._totalPieIncome;

  List<PieChartModel> _pieChartAmount;
  List<PieChartModel> get pieChartAmount => this._pieChartAmount;

  double _expensePrice;
  double get expensePrice => this._expensePrice;
  setExpensePrice(double val) => this._expensePrice = val;

  String _expenseName;
  String get expenseName => this._expenseName;
  setExpenseName(String val) => this._expenseName = val;

  String _expenseNode;
  String get expenseNode => this._expenseNode;
  setExpenseNode(String val) => this._expenseNode = val;

  void getPie() {
    if (_pieChartExpenses != null && _pieChartExpenses.isNotEmpty)
      _totalPieExpenses = _pieChartExpenses.reduce((a, b) => a + b);

    if (_pieChartIncome != null && _pieChartIncome.isNotEmpty)
      _totalPieIncome = _pieChartIncome.reduce((a, b) => a + b);

    _pieChartAmount = [
      PieChartModel(type: PieChartType.EXPENSE, amount: _totalPieExpenses),
      PieChartModel(type: PieChartType.INCOME, amount: _totalPieIncome),
    ];

    print({'_totalPieExpenses': _totalPieExpenses});
    print({'_totalPieIncome': _totalPieIncome});
    print({'_pieChartAmount': _pieChartAmount});
    print({'_pieChartExpenses': _pieChartExpenses});
    print({'_pieChartIncome': _pieChartIncome});

    notifyListeners();
  }

  Future<void> addAmount(ExpenseModel expense) async {
    try {
      _sumAmount += expensePrice;
      _expenses.add(expense);
      _pieChartIncome.add(expense.amount);
      notifyListeners();
      print({'_expenses': _expenses});

      getPie();
    } catch (err) {
      print(err);
    }
  }

  Future<void> minusAmount(ExpenseModel expense) async {
    _sumAmount -= expensePrice;
    _expenses.add(expense);
    _pieChartExpenses.add(expense.amount);
    notifyListeners();
    print({'_expenses': _expenses});
    getPie();
  }
}
