import 'package:flutter/material.dart';

Widget defaultText(
    {required String hintText,
    required bool obscureText,
    required TextEditingController controller,
    Function(String)? onChange,
    FormFieldValidator? validator,
    required TextInputType type}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    style: const TextStyle(color: Colors.white),
    keyboardType: type,
    obscureText: obscureText,
    onChanged: onChange,
    decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        )),
  );
}
