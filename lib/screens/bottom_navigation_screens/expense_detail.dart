import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/widgets/app_action_button.dart';
import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseDetailScreen extends StatelessWidget {
  static const String routeName = 'epense-detail-screen';

  const ExpenseDetailScreen({Key key}) : super(key: key);

  void _onDelete(BuildContext context, ExpenseModel expense) async {
    final AccountProvider accProvider =
        Provider.of<AccountProvider>(context, listen: false);
    await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: AppText("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  child: AppText(
                    "Cancel",
                    color: AppColor.grey,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: AppText(
                    "Delete",
                  ),
                  onPressed: () async {
                    showLoadingDialog(context);
                    await Future.delayed(Duration(seconds: 1));
                    final bool isSuccess =
                        await accProvider.deleteExpense(expense);

                    if (isSuccess)
                      Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final ExpenseModel expense = ModalRoute.of(context).settings.arguments;

    return AppScaffold(
      title: 'Expense Detail',
      bottomNavigatorBar: _buildDeleteButton(context, expense),
      child: _buildMainContainer(context, expense),
    );
  }

  Widget _buildDeleteButton(BuildContext context, expense) {
    return AppActionButton(
      title: 'Delete',
      function: () => _onDelete(context, expense),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    ExpenseModel expense,
  ) {
    return Column(
      children: [
        _buildCategoryContainer(expense, context),
        _buildInformationRows(expense).padding(),
      ],
    ).padding();
  }

  Container _buildCategoryContainer(
    ExpenseModel expense,
    BuildContext context,
  ) {
    return Container(
      color: expense.category.color,
      width: maxWidth(context),
      height: maxWidth(context) * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
            ),
            child: CategoryIcon(
              icon: expense.category.icon,
              color: expense.category.color,
              size: 48,
            ).center(),
          ),
          AppHeightSizedBox.smallBox,
          AppText(expense.category.name),
        ],
      ),
    );
  }

  Column _buildInformationRows(ExpenseModel expense) {
    return Column(
      children: [
        ListTile(
          leading: AppText('Amount'),
          trailing: AppText(
            expense.amount.toString(),
            isCurrencyFormat: true,
          ),
        ),
        ListTile(
          leading: AppText('Name'),
          trailing: AppText(
            expense.name,
          ),
        ),
        ListTile(
          leading: AppText('Notes'),
          trailing: AppText(
            expense.note,
          ),
        ),
      ],
    );
  }
}
