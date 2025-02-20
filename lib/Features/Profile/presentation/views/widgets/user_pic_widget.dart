import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
                            child: CircleAvatar(
                              radius: ConfigSize.defaultSize! * 1.5,
                              backgroundColor: ColorManager.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            radius: ConfigSize.defaultSize! * 2,
                            backgroundColor: ColorManager.primary,
                          );
  }
}