import 'package:ai_app/core/assets_path.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:flutter/material.dart';

class MedicalTrain extends StatefulWidget {
  const MedicalTrain({super.key});

  @override
  State<MedicalTrain> createState() => _MedicalTrainState();
}

class _MedicalTrainState extends State<MedicalTrain> {
  Color color1 = Color(0xffCAD6FF);
  Color color2 = Color(0xff2260FF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: color2,
              )),
          title: Text(
            "Rating",
            style: TextStyle(
              color: color2,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          actions: [
            appBarAction(Icons.search, color1, color2),
            appBarAction(Icons.settings, color1, color2),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Sort by:",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  small_widget(Icon(
                    Icons.sort_by_alpha_outlined,
                    color: Colors.white,
                  )),
                  appBarAction(Icons.star, color2, Colors.white),
                  appBarAction(Icons.favorite_border_rounded, color1, color2),
                  appBarAction(Icons.female, color1, color2),
                  appBarAction(Icons.male, color1, color2),
                ],
              ),
            ),
            listview_favourite()
          ],
        ));
  }

  Widget appBarAction(IconData icon, Color? color, Color? color_2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: Center(
          child: IconButton(
            icon: Icon(icon),
            onPressed: () {},
            color: color_2,
            iconSize: 10,
          ),
        ),
      ),
    );
  }

  Widget listview_favourite() {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return listview_item();
      },
    ));
  }

  Widget listview_item() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Container(
                color: color1,
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AssetsPath.moza),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            appBarAction(
                                Icons.workspace_premium, color2, Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Professional Doctor",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: color2,
                                      fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        doctor_name_widget(),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            small_widget(
                              Text("Info",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                            ),
                            SizedBox(
                              width: ConfigSize.defaultSize! * 5,
                            ),
                            appBarAction(
                              Icons.calendar_month,
                              Colors.white,
                              color2,
                            ),
                            appBarAction(
                              Icons.info_outlined,
                              Colors.white,
                              color2,
                            ),
                            appBarAction(
                              Icons.question_mark_outlined,
                              Colors.white,
                              color2,
                            ),
                            appBarAction(
                              Icons.favorite_outline_outlined,
                              Colors.white,
                              color2,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 10,
                  top: 5,
                  child: small_widget(Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 15),
                      Text("5.0",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))
                    ],
                  )))
            ],
          )),
    );
  }

  Widget doctor_name_widget() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(right: 60.0, left: 15, bottom: 8, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Olivia Turner, M.D.",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: color2),
              ),
              Text("Dermato-Endocrinology",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w400))
            ],
          ),
        ));
  }

  Widget small_widget(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          color: color2,
          child: child),
    );
  }
}
