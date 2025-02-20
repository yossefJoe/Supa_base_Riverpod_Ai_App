import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class AiPicWidget extends StatelessWidget {
  const AiPicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * 5,
      height: ConfigSize.defaultSize! * 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/icons/ai_logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
