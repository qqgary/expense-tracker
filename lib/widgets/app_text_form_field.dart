import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final String hint;
  final String initialValue;
  final bool isObscureText;
  final bool isEmailFormat;
  final bool isPhoneFormat;
  final bool isDigitsOnly;
  final bool isCheckEmpty;
  final bool isCheckDecimal;
  final int textLength;
  final int minLines;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final FocusNode node;
  final FocusNode next;
  final Function(String) validator;
  final Function(String) onSave;
  final Function(String) onChange;
  final Function onTap;
  final TextEditingController controller;
  final double bottomMargin;
  final double leftMargin;
  final InputDecoration customStyle;
  final Widget icon;

  AppTextFormField(
    this.hint, {
    @required this.node,
    this.initialValue,
    this.isObscureText: false,
    this.isEmailFormat: false,
    this.isPhoneFormat: false,
    this.isDigitsOnly: false,
    this.isCheckEmpty: true,
    this.isCheckDecimal: false,
    this.textLength: 50,
    this.minLines,
    this.inputType,
    this.inputAction: TextInputAction.next,
    this.next,
    this.validator,
    this.onSave,
    this.onChange,
    this.onTap,
    this.controller,
    this.bottomMargin: 0,
    this.leftMargin: 0,
    this.customStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      initialValue: initialValue,
      minLines: minLines ?? 1,
      maxLines: inputType == null ? 1 : null,
      style: TextStyle(color: AppColor.white),
      keyboardType: inputType,
      obscureText: isObscureText,
      inputFormatters: [
        if (isDigitsOnly) FilteringTextInputFormatter.digitsOnly,
        if (isCheckDecimal)
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        LengthLimitingTextInputFormatter(textLength),
      ],
      textInputAction: inputAction,
      focusNode: node,
      onFieldSubmitted: (term) => fieldFocusChange(context, node, next),
      decoration: customStyle ??
          textFormFieldInputDecoration(
            hint,
            icon,
          ),
      onChanged: onChange,
      validator: (String value) {
        if (isCheckEmpty && value.isEmpty) {
          node.unfocus();
          node.requestFocus();
          return '$hint cannot be empty.';
        }

        return null;
      },
      onSaved: onSave,
    );
  }
}
