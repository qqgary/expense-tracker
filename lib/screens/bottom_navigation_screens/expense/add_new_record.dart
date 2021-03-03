import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:expense_tracker/widgets/app_action_button.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:expense_tracker/widgets/app_text_form_field.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/category.dart';
import 'package:expense_tracker/widgets/app_scaffold.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';
import 'package:expense_tracker/widgets/category_icon.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddNewRecord extends StatelessWidget {
  final Category category;
  static const String routeName = 'add-new-record';
  AddNewRecord({this.category, Key key}) : super(key: key);

  final FocusNode _priceNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _noteNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onAddRecord(BuildContext context) {
    if (!_formKey.currentState.validate()) return;
    _formKey.currentState.save();
    final AccountProvider accProvider =
        Provider.of<AccountProvider>(context, listen: false);
    accProvider.addAmount();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Expense',
      leadingIcon: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.clear,
        ),
      ),
      bottomNavigatorBar: _buildAddButton(context),
      child: _buildMainContainer(context),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return AppActionButton(
      function: () => _onAddRecord(context),
      title: 'Add Now',
    );
  }

  Widget _buildMainContainer(BuildContext context) {
    final AccountProvider accProvider =
        Provider.of<AccountProvider>(context, listen: false);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Hero(
                tag: category.name,
                child: CategoryIcon(
                  icon: category.icon,
                  color: category.color,
                ),
              ),
              AppWidthSizedBox.mediumBox,
              AppText(category.name),
            ],
          ).padding(),
          AppHeightSizedBox.mediumBox,
          AppTextFormField(
            'MYR',
            node: _priceNode,
            isCheckDecimal: true,
            inputType: TextInputType.numberWithOptions(decimal: true),
            onSave: (String val) =>
                accProvider.setExpensePrice(double.parse(val)),
          ),
          AppHeightSizedBox.smallBox,
          AppTextFormField(
            'Name',
            node: _nameNode,
            isCheckEmpty: false,
            onSave: (String val) => accProvider.setExpenseName(val),
          ),
          AppHeightSizedBox.smallBox,
          AppTextFormField(
            'Add some notes',
            node: _noteNode,
            inputAction: TextInputAction.done,
            inputType: TextInputType.multiline,
            minLines: 3,
            isCheckEmpty: false,
            onSave: (String val) => accProvider.setExpenseNode(val),
          ),
        ],
      ).padding(),
    );
  }
}
