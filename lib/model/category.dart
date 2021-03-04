import 'package:flutter/material.dart';

class CategoryModel {
  IconData icon;
  Color color;
  String name;
  bool isExpense;

  CategoryModel({
    @required this.icon,
    @required this.color,
    @required this.name,
    @required this.isExpense,
  });
}
