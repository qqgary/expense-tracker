import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/screens/bottom_navigation_screens/expense_detail.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/widgets/category_icon.dart';
import 'package:expense_tracker/widgets/first_time_use.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountOverviewScreen extends StatelessWidget {
  static const String routeName = 'account-overview';
  const AccountOverviewScreen({Key key}) : super(key: key);

  Future<bool> _onDismiss(BuildContext context, ExpenseModel expense,
      AccountProvider accProvider) async {
    final bool res = await showDialog(
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
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final GeneralProvider genProvider = Provider.of<GeneralProvider>(context);
    return AppScaffold(
      title: 'Account Overview',
      actionItems: [
        InkWell(
          onTap: () => genProvider.setSOverviewVisibility(),
          child: genProvider.isFirstTimeLogin
              ? Container()
              : Icon(
                  // This can be more privacy when viewing expenses
                  genProvider.isOverviewVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                ).padding(),
        ),
      ],
      child: genProvider.isFirstTimeLogin
          ? FirstTimeUseContainer(context: context, genProvider: genProvider)
          : _buildMainContainer(context, genProvider),
    );
  }

  Widget _buildMainContainer(
    BuildContext context,
    GeneralProvider genProvider,
  ) {
    final AccountProvider accProvider = Provider.of<AccountProvider>(context);
    final double sumAmount = accProvider.sumAmount;

    return Column(
      children: [
        AppHeightSizedBox.mediumBox,
        _buildAccountBalance(
          context,
          sumAmount,
          genProvider.isOverviewVisibility,
        ),
        AppHeightSizedBox.mediumBox,
        _buildRecentExpenses(
          context,
          sumAmount,
          genProvider.isOverviewVisibility,
          accProvider,
        ),
      ],
    );
  }

  Container _buildRecentExpenses(
    BuildContext context,
    double sumAmount,
    bool isVisible,
    AccountProvider accProvider,
  ) {
    if (accProvider.expenses == null || accProvider.expenses.isEmpty)
      return Container(
        margin: EdgeInsets.only(top: maxHeight(context) * 0.2),
        child: AppText('No record yet!'),
      );

    return Container(
      padding: EdgeInsets.all(AppMargin.medium),
      width: maxWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Recent Expenses',
            fontSize: AppFontSize.extraTitle,
          ),
          AppHeightSizedBox.mediumBox,
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: accProvider.expenses.length,
            itemBuilder: (ctx, i) {
              ExpenseModel expense = accProvider.expenses[i];
              return Dismissible(
                key: Key(expense.id),
                background: slideLeftBackground(),
                confirmDismiss: (DismissDirection direction) =>
                    _onDismiss(context, expense, accProvider),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ExpenseDetailScreen.routeName,
                      arguments: expense,
                    );
                  },
                  leading: CategoryIcon(
                    icon: expense.category.icon,
                    color: expense.category.color,
                  ),
                  title: AppText(expense.category.name),
                  subtitle: expense.name.isEmpty
                      ? null
                      : AppText(expense.name, color: AppColor.grey),
                  trailing: AppText(
                    isVisible ? expense.amount.toString() : '🙈',
                    color: expense.category.isExpense
                        ? AppColor.red
                        : AppColor.accentGreen,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: AppColor.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            AppText(
              " Delete",
              color: Colors.white,
              fontWeight: AppFontWeight.bold,
              textAlign: TextAlign.right,
            ),
            AppWidthSizedBox.largeBox,
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget _buildAccountBalance(
    BuildContext context,
    double sumAmount,
    bool isVisible,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              AppText(
                'Total',
                fontSize: AppFontSize.extraSmall,
                color: AppColor.grey,
              ),
              AppText('MYR'),
            ],
          ),
          AppWidthSizedBox.mediumBox,
          isVisible
              ? AppText(
                  sumAmount.toString(),
                  isCurrencyFormat: true,
                  color: (sumAmount) < 0 ? AppColor.red : AppColor.green,
                  fontSize: AppFontSize.extraTitle,
                  fontWeight: AppFontWeight.bold,
                )
              : AppText(
                  sumAmount < 0 ? 'Bankruptcy' : 'Billionaire',
                  color: sumAmount < 0 ? AppColor.red : AppColor.green,
                  fontSize: AppFontSize.extraTitle,
                  fontWeight: AppFontWeight.bold,
                ),
        ],
      ).padding();
}
