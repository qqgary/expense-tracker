import 'package:expense_tracker/themes/styles.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const CategoryIcon(
      {@required this.icon, @required this.color, this.size, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppMargin.extraSmall),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: size ?? null,
      ),
    );
  }
}
