import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//instead oef using Navigator each and every time i have created a common navigator helper
class NavigationHelper {
  //push a new screen
  static void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  //push with a named Route
  static void pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  //to replace current screen
  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // pop the current screen
  static void pop(BuildContext context, {dynamic results}) {
    Navigator.pop(context, results);
  }

  // push and remove all previous screens
  static void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
