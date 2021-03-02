import 'package:expense_tracker/model/aaccount.dart';
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
            // This can be more privacy when adding expense
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
    AccountModel account = accProvider.account;
    return Column(
      children: [
        _buildAccountBalance(
            context, account, genProvider.isOverviewVisibility),
        AppHeightSizedBox.mediumBox,
        _buildTop3Categories(
            context, account, genProvider.isOverviewVisibility),
      ],
    );
  }

  Container _buildTop3Categories(
    BuildContext context,
    AccountModel account,
    bool isVisible,
  ) {
    return Container(
      padding: EdgeInsets.all(AppMargin.medium),
      width: maxWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'TOP 3',
            fontSize: AppFontSize.extraTitle,
          ),
          AppHeightSizedBox.mediumBox,
          ListTile(
            leading: CategoryIcon(
              icon: Icons.fastfood,
              color: AppColor.red,
            ),
            title: AppText('Food'),
            trailing: AppText(
              'MYR1,307.00',
              color: AppColor.red,
            ),
          ),
          ListTile(
            leading: CategoryIcon(
              icon: FontAwesomeIcons.car,
              color: AppColor.blue,
            ),
            title: AppText('Cars'),
            trailing: AppText(
              'MYR1,307.00',
              color: AppColor.red,
            ),
          ),
          ListTile(
            leading: CategoryIcon(
              icon: Icons.local_hospital,
              color: AppColor.orange,
            ),
            title: AppText('Medication'),
            trailing: AppText(
              'MYR1,307.00',
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildAccountBalance(
    BuildContext context,
    AccountModel account,
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
                (account.totalEarning - account.totalExpenses).toString(),
                color: (account.totalEarning - account.totalExpenses) < 0
                    ? AppColor.red
                    : AppColor.green,
                fontSize: AppFontSize.extraTitle,
                fontWeight: AppFontWeight.bold,
              )
            : AppText(
                (account.totalEarning - account.totalExpenses) < 0
                    ? 'Bankruptcy'
                    : 'Billionaire',
                color: (account.totalEarning - account.totalExpenses) < 0
                    ? AppColor.red
                    : AppColor.green,
                fontSize: AppFontSize.extraTitle,
                fontWeight: AppFontWeight.bold,
              ),
      ],
    );
  }
}
