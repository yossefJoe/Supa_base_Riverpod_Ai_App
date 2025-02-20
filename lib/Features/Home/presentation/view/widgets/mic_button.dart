import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  const MicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
        child:
            Center(child: IconButton(onPressed: () {}, icon: Icon(Icons.mic,color: ColorManager.white,))));
  }
}
