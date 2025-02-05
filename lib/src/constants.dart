import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Color primaryColor = Colors.black;

double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

double shorterDimension(BuildContext context) {
  final dH = deviceHeight(context);
  final dW = deviceWidth(context);
  return (dH < dW) ? dH : dW;
}

double longerDimension(BuildContext context) {
  final dH = deviceHeight(context);
  final dW = deviceWidth(context);
  return (dH > dW) ? dH : dW;
}

// Thank you so much, Nicholas Song from Medium!
// https://medium.com/@nickysong/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

MaterialColor primarySwatch = createMaterialColor(Colors.red);

String backgroundImage = 'assets/images/2024-03-25_resized.jpg';

lazyPush(BuildContext context, Widget page) {
  Navigator.push(context,
      MaterialPageRoute<void>(builder: (BuildContext context) => page));
}

void showSnackBar(String text, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(text),
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Offset findPos(GlobalKey key) {
  BuildContext? context = key.currentContext;
  if (context == null) {
    if (kDebugMode) {
      print(
          'constants/findPos(): Couldn\'t find current build context for widget\'s GlobalKey. \n'
          'Perhaps widget not mounted.');
    }
    throw Exception('');
  }
  RenderBox box = context.findRenderObject() as RenderBox;
  return box.localToGlobal(Offset.zero);
}

double arctanOffset(Offset? pos, Offset pos_0) {
  if (pos == null) return 0;
  return atan((pos.dx - pos_0.dx) / (pos.dy - pos_0.dy));
}
