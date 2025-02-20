import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ConfigSize.defaultSize! * 7,
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 5),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 5),
            borderSide: BorderSide(color: ColorManager.primary),
          ),
          hintText: 'Ask what\'s on mind..',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
