import 'package:ai_app/Features/Home/presentation/view/widgets/message_answer_template.dart';
import 'package:ai_app/Features/Home/presentation/view/widgets/message_button.dart';
import 'package:ai_app/Features/Home/presentation/view/widgets/mic_button.dart';
import 'package:ai_app/Features/Home/presentation/view/widgets/search_bar.dart';
import 'package:ai_app/Features/Profile/presentation/cubits/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:ai_app/core/app_router.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:ai_app/core/speech_to_text_methods.dart';
import 'package:ai_app/core/supabase_methods.dart';
import 'package:ai_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpeechToText _speechToText = SpeechToText();
  TextEditingController controller = TextEditingController();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
  }

  bool isTyping = false;
  String userNameedited(String name) {
    List<String> editedName = [];
    for (var i = 0; i < name.length; i++) {
      if (i == 0) {
        editedName.add(name[i].toUpperCase());
        continue;
      }
      editedName.add(name[i]);
    }
    print(editedName);
    return editedName.join();
  }

  Widget build(BuildContext context) {
    final getQuestions = SupabaseMethods.instance.supabase
        .from('questions')
        .stream(primaryKey: ['id']);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
              builder: (context, state) {
                if (state is FetchUserDataSuccess) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/robot.png",
                                            height:
                                                ConfigSize.defaultSize! * 15,
                                          ),
                                          SizedBox(
                                            height: ConfigSize.defaultSize! * 2,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30.0),
                                            child: Text(
                                              "Hello, ${userNameedited(state.userData[0]['name'])} How can I help you?",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                                MessageanswerTemplate(
                                  userName: state.userData[0]['name'],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: SearchBarWidget(
                            controller: controller,
                            onChanged: (value) {
                              setState(() {
                                isTyping = true;
                              });
                            },
                          )),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 2,
                          ),
                          controller.text.isNotEmpty
                              ? MessageButton()
                              : MicButton()
                        ],
                      )
                    ],
                  );
                }
                if (state is FetchUserDataFailure) {
                  return Text(state.errMessage);
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}


  //    Text(
                //   _speechToText.isListening
                //       ? '$_lastWords'
                //       : _speechEnabled
                //           ? 'Tap the microphone to start listening...'
                //           : 'Speech not available',
                // ),

                // StreamBuilder(
                //   stream: getQuestions,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: ListView.builder(
                //             itemCount: snapshot.data?.length ?? 0,
                //             itemBuilder: (context, index) {
                //               return Text(snapshot.data?[index]['content']);
                //             },
                //           ),
                //         ),
                //       );
                //     }
                //     return Text("No data");
                //   },
                // ),