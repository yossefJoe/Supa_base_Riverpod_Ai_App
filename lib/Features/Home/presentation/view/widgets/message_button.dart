import 'package:ai_app/core/assets_path.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
        child: Center(
          child: IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(AssetsPath.send),
                  color: ColorManager.white)),
        ));
  }
}
