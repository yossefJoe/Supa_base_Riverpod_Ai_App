import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Container(
          width: ConfigSize.defaultSize! * 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title),
      ),
    );
  }
}
