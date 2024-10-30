import 'package:flutter/material.dart';

Widget defaultText(
    {
    required String hintText,
    required bool obscureText,
    required TextEditingController controller,
    required TextInputType type}) {
  return TextField(
    controller: controller,
    keyboardType: type,
    obscureText: obscureText,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        )),
  );
}
