import 'package:expense_tracker/model/category.dart';

class AccountModel {
  double totalEarning;
  double totalExpenses;
  List<Category> categories;

  AccountModel({this.totalEarning, this.totalExpenses, this.categories});
}
