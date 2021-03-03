import 'package:expense_tracker/model/category.dart';

class ExpenseModel {
  String id;
  double amount;
  String name;
  String note;
  CategoryModel category;

  ExpenseModel({this.id, this.amount, this.name, this.note, this.category});
}
