import 'package:ai_app/core/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.controller,
      this.onChange});
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: icon == Icons.lock_outline_rounded ? true : false,
      onChanged: onChange,
      cursorColor: ColorManager.black,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: ColorManager.grey,
          ),
          fillColor: ColorManager.white,
          hintStyle: TextStyle(color: ColorManager.grey),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder()),
    );
  }
}
