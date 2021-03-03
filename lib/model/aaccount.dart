import 'package:expense_tracker/model/category.dart';

class AccountModel {
  double amount;
  String title;
  String description;
  Category categories;

  AccountModel({this.amount, this.categories});
}
