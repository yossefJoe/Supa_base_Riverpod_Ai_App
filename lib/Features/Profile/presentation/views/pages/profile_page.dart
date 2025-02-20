import 'package:ai_app/Features/Profile/presentation/cubits/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:ai_app/Features/Home/presentation/view/widgets/search_bar.dart';
import 'package:ai_app/core/assets_path.dart';
import 'package:ai_app/core/color_manager.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:ai_app/core/widgets/custom_listtile.dart';
import 'package:ai_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            CustomTextField(
                hintText: "Search chat history",
                icon: Icons.search,
                controller: searchController),
            SizedBox(
              height: ConfigSize.defaultSize! * 2,
            ),
            CustomListtile(
              image: AssetsPath.aiLogo,
              title: "Rak-GPT",
            ),
            CustomListtile(
              image: AssetsPath.feedback,
              title: "Customize Feedback",
            ),
            CustomListtile(
              image: AssetsPath.community,
              title: "Community",
            ),
            Spacer(),
            BlocBuilder<FetchUserDataCubit, FetchUserDataState>(
              builder: (context, state) {
                if (state is FetchUserDataSuccess) {
                  return Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          CircleAvatar(
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
                          ),
                          SizedBox(
                            width: ConfigSize.defaultSize! * 1,
                          ),
                          Text(state.userData[0]['name']),
                        ],
                      ));
                }
                if (state is FetchUserDataFailure) {
                  return Text(state.errMessage);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(
              height: ConfigSize.defaultSize! * 5,
            )
          ],
        ),
      ),
    );
  }
}
