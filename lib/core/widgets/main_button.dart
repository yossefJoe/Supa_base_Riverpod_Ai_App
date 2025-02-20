import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key, this.height = 100, required this.color, required this.title, required this.onPressed});
  final double? height;
  final Color color;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      height: height,
      minWidth: ConfigSize.screenWidth,
      color: color,
      child: Text(
        title,
        style: TextStyle(color: ColorManager.white, fontSize: 18),
      ),
    );
  }
}
