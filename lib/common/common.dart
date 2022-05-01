import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//* Color
const blackColor = Color.fromRGBO(48, 47, 48, 1.0);
const greyColor = Color.fromRGBO(141, 141, 141, 1.0);
const whiteColor = Colors.white;
const darkBlueColor = Color.fromRGBO(20, 25, 45, 1.0);

//* Text Font
const TextTheme defaultText = TextTheme(
    headline1:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 26),
    headline2:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 22),
    headline3:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 20),
    headline4:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 16),
    headline5:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 14),
    headline6:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1:
        TextStyle(color: blackColor, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2:
        TextStyle(color: greyColor, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme smallText = TextTheme(
    headline1:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 22),
    headline2:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 20),
    headline3:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 18),
    headline4:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 14),
    headline5:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 12),
    headline6:
        TextStyle(color: blackColor, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: blackColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: greyColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1:
        TextStyle(color: blackColor, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2:
        TextStyle(color: greyColor, fontSize: 10, fontWeight: FontWeight.w400));

//* Widget
Widget addVSpace(double height) {
  return SizedBox(height: height);
}

Widget addHSpace(double width) {
  return SizedBox(width: width);
}

//* Function
String formatCurrency(dynamic amount, {int decimalCount = 0}) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: decimalCount,
  );
  return currencyFormatter.format(amount);
}
