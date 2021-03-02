import 'package:expense_tracker/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AppScaffold extends StatelessWidget {
  final bool appBar;
  final Widget titleChild;
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
  final bool isActionBar;
  final bool isScrollView;
  final Widget floatingActionButton;
  final Widget actionBar;
  final Widget bottomNavigatorBar;
  final Widget leadingIcon;

  const AppScaffold({
    this.titleChild,
    this.backgroundColor: Colors.white,
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
    this.isActionBar,
    this.floatingActionButton,
    this.actionBar,
    this.bottomNavigatorBar,
    this.leadingIcon,
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
                title: Center(
                  child: titleChild,
                ),
                iconTheme: IconThemeData(color: backButtonColor),
                actions: <Widget>[],
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
