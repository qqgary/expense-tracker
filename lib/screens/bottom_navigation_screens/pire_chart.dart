import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:expense_tracker/widgets/first_time_use.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/model/pie_chart.dart';

class PieChartScreen extends StatelessWidget {
  static String routeName = 'pie-chart';

  @override
  Widget build(BuildContext context) {
    final GeneralProvider genProvider = Provider.of<GeneralProvider>(context);
    return AppScaffold(
      title: 'Pie Chart',
      isScrollView: false,
      child: genProvider.isFirstTimeLogin
          ? FirstTimeUseContainer(context: context, genProvider: genProvider)
          : _buildMainContainer(context, genProvider),
    );
  }

  Container _buildMainContainer(
    BuildContext context,
    GeneralProvider genProvider,
  ) =>
      Container(
        width: maxWidth(context),
        child: Column(
          children: [
            _buildPieChart(context, genProvider),
            Container(
              margin: EdgeInsets.only(top: maxHeight(context) * 0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDots(AppColor.red, 'Expenses'),
                  _buildDots(AppColor.accentGreen, 'Income'),
                ],
              ),
            )
          ],
        ),
      );

  Row _buildDots(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        AppWidthSizedBox.smallBox,
        AppText(title),
      ],
    );
  }

  Container _buildPieChart(BuildContext context, GeneralProvider genProvider) =>
      Container(
        margin: EdgeInsets.only(top: maxHeight(context) * 0.3),
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
                touchCallback: (PieTouchResponse pieTouchResponse) {
              if (pieTouchResponse.touchInput is FlLongPressEnd ||
                  pieTouchResponse.touchInput is FlPanEnd)
                genProvider.setPieChartTouchedIndex(-1);
              else
                genProvider.setPieChartTouchedIndex(
                    pieTouchResponse.touchedSectionIndex);
            }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 40,
            sections: showingSections(context),
          ),
        ),
      );

  List<PieChartSectionData> showingSections(BuildContext context) {
    final AccountProvider accProvider = Provider.of<AccountProvider>(context);
    final double total =
        accProvider.totalPieExpenses + accProvider.totalPieIncome;

    return accProvider.pieChartAmount.map((item) {
      final double amount = item.amount;
      final double percent = total == 0 ? 0 : amount / total * 100;
      final PieChartType type = item.type;

      switch (type) {
        case PieChartType.EXPENSE:
          return PieChartSectionData(
            color: AppColor.red,
            value: amount,
            title: '$percent%',
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.white),
          );
        case PieChartType.INCOME:
          return PieChartSectionData(
            color: AppColor.accentGreen,
            value: amount,
            title: '$percent%',
            titleStyle:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.white),
          );

        default:
          return null;
      }
    }).toList();
  }
}
