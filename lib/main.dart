import 'package:expense_tracker/config/routes.dart';
import 'package:expense_tracker/provider/account.dart';
import 'package:expense_tracker/provider/general.dart';
import 'package:expense_tracker/screens/main_screen.dart';
import 'package:expense_tracker/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation); //initialize SizerUtil
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => GeneralProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => AccountProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'Expense Tracker',
            darkTheme: Constant.darkTheme,
            theme: Constant.darkTheme,
            home: MainScreen(),
            initialRoute: MainScreen.routeName,
            routes: Router.routes,
          ),
        );
      });
    });
  }
}
