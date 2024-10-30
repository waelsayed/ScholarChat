import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color color = Colors.black,
  double textSize = 20,
  double radius = 3.0,
  bool isUpperCase = true,
  required VoidCallback? onPress,
  required String text,
}) {
  return Container(
    height: 50.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: MaterialButton(
      onPressed: onPress,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style:  TextStyle(
          fontSize: textSize,
          color: color,
        ),
      ),
    ),
  );
}