import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/widgets/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AccountOverviewScreen extends StatelessWidget {
  static const String routeName = 'account-overview';
  const AccountOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GeneralProvider genProvider = Provider.of<GeneralProvider>(context);
    return AppScaffold(
      title: 'Account Overview',
      actionItems: [
        InkWell(
          onTap: () => genProvider.setSOverviewVisibility(),
          child: Icon(
            // This can be more privacy when viewing expenses
            genProvider.isOverviewVisibility
                ? Icons.visibility
                : Icons.visibility_off,
          ).padding(),
        ),
      ],
      child: _buildMainContainer(context, genProvider),
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
        _buildAccountBalance(
            context, sumAmount, genProvider.isOverviewVisibility),
        AppHeightSizedBox.mediumBox,
        _buildRecentExpenses(
            context, sumAmount, genProvider.isOverviewVisibility, accProvider),
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
      return Container();

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
            shrinkWrap: true,
            itemCount: accProvider.expenses.length,
            itemBuilder: (ctx, i) {
              ExpenseModel expense = accProvider.expenses[i];
              return ListTile(
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
                  color: AppColor.red,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Row _buildAccountBalance(
    BuildContext context,
    double sumAmount,
    bool isVisible,
  ) {
    return Row(
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
    );
  }
}
