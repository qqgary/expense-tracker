import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:expense_tracker/utils/constant.dart';

class AppColor {
  static Color primary = Colors.orangeAccent;
  static Color secondary = Color(0xff40bfb4);
  static Color white = Colors.white;
  static Color divider = Colors.grey[200];
  static Color placeHolder = Colors.grey;
  static Color darkGrey = Colors.grey[700];
  static Color grey = Colors.grey;
  static Color lightGrey = Colors.grey[200];
  static Color veryLightGrey = Colors.grey[100];
  static Color loading = Colors.grey[400];
  static Color black = Color(0xff151515);
  static Color red = Color(0xffed5f59);
  static Color deepRed = Color(0xffD55550);
  static Color green = Colors.green;
  static Color accentGreen = Colors.greenAccent[400];
  static Color blueText = Colors.blueAccent;
  static Color blue = Colors.blueAccent;
  static Color yellow = Colors.yellowAccent;
  static Color orange = Colors.orange;
  static Color voucher = lightGrey.withOpacity(0.8);
  static Color background = Color(0xfff1f3f6);
  static Color success = Color(0xff91E268);
  static Color info = Color(0xff0093FC);
  static Color warning = Color(0xffF4C11A);
  static Color error = Color(0xffF96366);
}

class AppIcon {
  static IconData right = Icons.chevron_right;
}

class AppIconSize {
  static double small = 24;
  static double medium = 48;
  static double large = 96;
}

class AppDividerHeight {
  static double medium = 8;
}

class AppFontSize {
  static double extraTitle = 20.0.sp;
  static double title = 18.0.sp;
  static double subTitle = 16.0.sp;
  static double smallerSubTitle = 14.5.sp;
  static double extraSmall = 10.0.sp;
  static double small = 11.0.sp;
  static double medium = 12.0.sp;
  static double large = 13.0.sp;
}

class AppFontWeight {
  static FontWeight normal = FontWeight.w400;
  static FontWeight bold = FontWeight.bold;
  static FontWeight bolder = FontWeight.w900;
}

class AppMargin {
  static double doubleExtraSmall = 4;
  static double extraSmall = 8;
  static double small = 16;
  static double medium = 24;
  static double large = 32;
  static double extraLarge = 48;
  static double doubleLarge = 64;
  static double doubleExtraLarge = 96;
}

class AppOpacity {
  static double half = 0.5;
}

const List<Color> lineChartGradientColors = [
  Colors.orangeAccent,
  Color(0xff02d39a),
];

class AppCornerRadius {
  static double small = 4.0;
  static double normal = 20.0;
}

class AppBorderRadius {
  static BorderRadiusGeometry small = BorderRadius.circular(4.0);
  static BorderRadiusGeometry normal = BorderRadius.circular(12.0);
  static BorderRadiusGeometry oval =
      BorderRadius.all(Radius.elliptical(100, 100));
  static BorderRadiusGeometry leftRadius = BorderRadius.only(
    topLeft: Radius.circular(12.0),
    bottomLeft: Radius.circular(12.0),
  );
  static BorderRadiusGeometry rightRadius = BorderRadius.only(
    topRight: Radius.circular(12.0),
    bottomRight: Radius.circular(12.0),
  );
}

class AppHeightSizedBox {
  static SizedBox doubleExtraSmallBox = SizedBox(height: 4);
  static SizedBox extraSmallBox = SizedBox(height: 8);
  static SizedBox smallBox = SizedBox(height: 16);
  static SizedBox mediumBox = SizedBox(height: 24);
  static SizedBox largeBox = SizedBox(height: 32);
  static SizedBox extraLargeBox = SizedBox(height: 48);
  static SizedBox doubleLargeBox = SizedBox(height: 64);
}

class AppWidthSizedBox {
  static SizedBox doubleExtraSmallBox = SizedBox(width: 4);
  static SizedBox extraSmallBox = SizedBox(width: 8);
  static SizedBox smallBox = SizedBox(width: 16);
  static SizedBox mediumBox = SizedBox(width: 24);
  static SizedBox largeBox = SizedBox(width: 32);
  static SizedBox extraLargeBox = SizedBox(width: 48);
  static SizedBox doubleLargeBox = SizedBox(width: 64);
}

InputDecoration textFormFieldInputDecoration(String hintText, Widget icon) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    focusColor: AppColor.white,
    fillColor: Constant.darkPrimary,
    hintStyle: TextStyle(color: AppColor.grey),
    suffixIcon: icon,
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.normal,
    ),
  );
}

InputDecoration textFormFieldFoodInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: AppColor.white,
    hintStyle: TextStyle(color: AppColor.grey),
    contentPadding: EdgeInsets.all(AppMargin.extraSmall),
    border: OutlineInputBorder(
      borderRadius: AppBorderRadius.small,
      borderSide: BorderSide(
        color: AppColor.black,
      ),
    ),
  );
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(40.0),
      ),
    ),
    fillColor: Colors.grey.withOpacity(0.45),
  );
}

BoxDecoration loginBoxdecoration = BoxDecoration(
  color: Colors.black.withOpacity(AppOpacity.half),
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(AppCornerRadius.normal),
    topRight: Radius.circular(AppCornerRadius.normal),
  ),
);
