import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/provider/general.dart';

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
    return Column(
      children: [
        _buildAccountBalance(genProvider),
        AppHeightSizedBox.mediumBox,
        _buildTop3Categories(context),
      ],
    );
  }

  Container _buildTop3Categories(BuildContext context) {
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
            leading: _buildCategoryIcon(
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
            leading: _buildCategoryIcon(
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
            leading: _buildCategoryIcon(
                icon: Icons.local_hospital, color: AppColor.orange),
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

  Container _buildCategoryIcon(
      {@required IconData icon, @required Color color}) {
    return Container(
      padding: EdgeInsets.all(AppMargin.extraSmall),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
      ),
    );
  }

  Row _buildAccountBalance(GeneralProvider genProvider) {
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
        genProvider.isOverviewVisibility
            ? AppText(
                '10,016.51',
                color: AppColor.green,
                fontSize: AppFontSize.extraTitle,
                fontWeight: AppFontWeight.bold,
              )
            : AppText(
                'Billionaire',
                color: AppColor.green,
                fontSize: AppFontSize.extraTitle,
                fontWeight: AppFontWeight.bold,
              ),
      ],
    );
  }
}
