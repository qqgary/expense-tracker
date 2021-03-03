import 'package:expense_tracker/model/category.dart';

class AccountModel {
  double amount;
  String title;
  String description;
  CategoryModel category;

  AccountModel({this.amount, this.category});
}
