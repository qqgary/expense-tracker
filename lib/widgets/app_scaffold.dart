import 'package:expense_tracker/themes/styles.dart';
import 'package:expense_tracker/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/utils/widget_modifier.dart';

class AppScaffold extends StatelessWidget {
  final bool appBar;
  final String title;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final Color backButtonColor;
  final Widget child;
  final Key scaffoldKey;
  final Widget drawer;
  final Widget tabBar;
  final bool isElevation;
  final bool isBackButton;
  final bool isDrawer;
  final bool isScrollView;
  final Widget floatingActionButton;
  final Widget actionBar;
  final Widget bottomNavigatorBar;
  final Widget leadingIcon;
  final List<Widget> actionItems;

  const AppScaffold({
    this.title,
    this.backgroundColor: const Color(0xff1E1E1E),
    this.child,
    this.appBarBackgroundColor: const Color(0xff00adef),
    this.backButtonColor: Colors.white,
    this.isElevation: false,
    this.isBackButton: true,
    this.appBar: true,
    this.isDrawer: true,
    this.isScrollView: true,
    this.scaffoldKey,
    this.drawer,
    this.tabBar,
    this.floatingActionButton,
    this.actionBar,
    this.bottomNavigatorBar,
    this.leadingIcon,
    this.actionItems,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigatorBar ?? null,
        appBar: appBar
            ? AppBar(
                leading: isBackButton ? leadingIcon : Container(),
                elevation: isElevation ? AppBarElevation.normal : 0,
                title: AppText(
                  title,
                  color: AppColor.white,
                  fontSize: AppFontSize.large,
                ).padding(),
                iconTheme: IconThemeData(color: backButtonColor),
                actions: actionItems,
                bottom: tabBar,
              )
            : null,
        floatingActionButton: floatingActionButton,
        body: isScrollView
            ? SingleChildScrollView(
                child: child,
              )
            : child,
      ),
    );
  }
}
