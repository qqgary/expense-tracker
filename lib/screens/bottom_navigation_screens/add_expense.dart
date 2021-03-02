import 'package:expense_tracker/model/category.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/widgets/category_icon.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/utils/constant.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';

class AddExpenseScreen extends StatelessWidget {
  static const String routeName = 'add-expense-screen';
  const AddExpenseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'New Record',
      child: _buildMainContainer(context),
    );
  }

  Widget _buildMainContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Choose one category',
          color: AppColor.white,
        ).padding(),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: Constant.categories.length,
          itemBuilder: (_, i) {
            Category category = Constant.categories[i];

            return Container(
              padding: EdgeInsets.all(AppMargin.small),
              child: Column(
                children: [
                  CategoryIcon(
                    icon: category.icon,
                    color: category.color,
                  ),
                  AppHeightSizedBox.smallBox,
                  AppText(
                    category.name,
                    color: AppColor.grey,
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
