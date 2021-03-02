import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppColor {
  static Color primary = Color(0xff00adef);
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

class AppBarElevation {
  static double normal = 6;
}

class AppCardElevation {
  static double normal = 4;
}

class AppTextColor {}

class AppTextShadow {
  static List<Shadow> normal = [
    Shadow(
      offset: Offset(0.5, 0.5),
      blurRadius: 2.0,
      color: Colors.black.withOpacity(0.5),
    ),
  ];
}

class AppBoxShadow {
  static const List<BoxShadow> normal = [
    BoxShadow(
      color: Color(0xffe0e0e0),
      blurRadius: 5.0, // has the effect of softening the shadow
      spreadRadius: 2.0, // has the effect of extending the shadow
      offset: Offset(
        0.0,
        3.0, // vertical, move down 10
      ),
    ),
  ];

  static const List<BoxShadow> trendingVoucher = [
    BoxShadow(
      color: Colors.black87,
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(
        0.0,
        1.0,
      ),
    ),
  ];

  static final Color color = Colors.grey[200];
  static const List<BoxShadow> editProfileContainer = [
    BoxShadow(
      color: Color(0xffbababa),
      blurRadius: 10,
      spreadRadius: 2.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    ),
  ];
}

class AppListStop {
  static List<double> normal = [
    0.1,
    0.5,
    0.7,
    0.9,
  ];
}

class AppColorGradient {
  static List<double> stops = [
    0.1,
    0.5,
    0.7,
    0.9,
  ];

  static List<double> passesTitle = [
    0,
    0.2,
    1,
  ];
}

class AppColorList {
  static List<Color> grey = [
    Colors.black.withOpacity(0.5),
    Colors.black.withOpacity(0.2),
    Colors.black.withOpacity(0.05),
    Colors.black.withOpacity(0.0),
  ];

  static List<Color> passesTitleGrey = [
    Colors.black.withOpacity(0),
    Colors.black.withOpacity(0.08),
    Colors.black.withOpacity(0.6),
  ];
  static List<Color> red = [
    Colors.red[700],
    Colors.red[600],
    Colors.red[500],
    Colors.red[400],
  ];
  static List<Color> green = [
    Colors.green[700],
    Colors.green[600],
    Colors.green[500],
    Colors.green[400],
  ];
  static List<Color> orange = [
    Colors.orange[700],
    Colors.orange[600],
    Colors.orange[500],
    Colors.orange[400],
  ];
  static List<Color> blue = [
    Colors.blue[700],
    Colors.blue[600],
    Colors.blue[500],
    Colors.blue[400],
  ];
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
    fillColor: AppColor.lightGrey,
    hintStyle: TextStyle(color: AppColor.grey),
    suffixIcon: icon,
    contentPadding: EdgeInsets.symmetric(horizontal: AppMargin.medium),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
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
