import 'package:flutter/material.dart';

Widget verticalSpace(double size) => SizedBox(height: size);

Widget horizontalSpace(double size) => SizedBox(width: size);

double screenWidthFraction(double fraction, BuildContext context) =>
    MediaQuery.of(context).size.width * fraction;

double screenHeightFraction(double fraction, BuildContext context) =>
    MediaQuery.of(context).size.height * fraction;

double statusBarHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;
