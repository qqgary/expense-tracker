import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/widgets/app_action_button.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/widgets/app_text.dart';

class FirstTimeUseContainer extends StatelessWidget {
  const FirstTimeUseContainer({
    Key key,
    @required this.context,
    @required this.genProvider,
  }) : super(key: key);

  final BuildContext context;
  final GeneralProvider genProvider;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            child: Image.asset(
              'assets/empty_space.png',
              height: maxHeight(context) * 0.6,
            ),
          ),
          AppText('You haven\'t started to record!'),
          AppActionButton(
            title: 'Go Add Now',
            function: () {
              genProvider.bottomNavigationIndex = 1;
            },
            isMaxSize: true,
          ).padding(),
        ],
      );
}
