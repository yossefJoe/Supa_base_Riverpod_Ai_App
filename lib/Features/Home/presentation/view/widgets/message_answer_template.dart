import 'package:ai_app/Features/Profile/presentation/views/widgets/ai_pic_widget.dart';
import 'package:ai_app/Features/Profile/presentation/views/widgets/user_pic_widget.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:flutter/material.dart';

class MessageanswerTemplate extends StatelessWidget {
  const MessageanswerTemplate({super.key, required this.userName});
  final String userName ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserNameWidget(),
              SizedBox(
                width: 10,
              ),
             Text(
                userName,
             )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("Hi, I'm a chatbot. How can I help you?"),
          SizedBox(
            height: 10,
          ),
          AiPicWidget(),
          SizedBox(
            height: 10,
          ),
          Text("Hi, I'm a chatbot. How can I help you?"),
        ],
      ),
    );
  }
}
