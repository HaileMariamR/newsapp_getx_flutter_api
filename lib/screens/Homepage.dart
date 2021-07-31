import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/utilities/constants.dart';
import 'Categories/Business.dart';
import 'Categories/Entertainment.dart';
import 'Categories/General.dart';
import 'Categories/Science.dart';
import 'Categories/Technology.dart';
import 'Categories/Home.dart';
import 'Categories/Sport.dart';
import 'Categories/Health.dart';
import 'package:newsapp/appState/AppState.dart';
import 'package:newsapp/screens/Favourite.dart';
import 'About.dart';
import 'Settings.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  List<Widget> listoftabstitle = [
    Text(
      "Home",
      style: ktabtitlestyle,
    ),
    Text(
      "Business",
      style: ktabtitlestyle,
    ),
    Text(
      "Entertainment",
      style: ktabtitlestyle,
    ),
    Text(
      "General",
      style: ktabtitlestyle,
    ),
    Text(
      "Health",
      style: ktabtitlestyle,
    ),
    Text(
      "Sports",
      style: ktabtitlestyle,
    ),
    Text(
      "Technology",
      style: ktabtitlestyle,
    ),
    Text(
      "Science",
      style: ktabtitlestyle,
    )
  ];

  @override
  Widget build(BuildContext context) {
    AppState appState = Get.put(AppState(), permanent: true);

    return SafeArea(
      child: DefaultTabController(
          length: listoftabstitle.length,
          child: Builder(builder: (BuildContext context) {
            return Scaffold(
              drawer: Drawer(
                  child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                    padding: EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 130, left: 20),
                          child: Text(
                            "se.hailemariam.fikadie@gmail.com",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 90, left: 20),
                          child: Text(
                            "Eharry",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'pacifico',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://media-exp1.licdn.com/dms/image/C4E03AQGlC95Zri6GaA/profile-displayphoto-shrink_800_800/0/1574148998530?e=1632960000&v=beta&t=Su5ndfMs12vGrMoL95_6DiKTFHjTXQyZpJ6pMEmEYU8"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(0);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.business),
                    title: Text("Business"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(1);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.emoji_emotions),
                    title: Text("Entertainment"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(2);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text("General"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(3);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.health_and_safety),
                    title: Text("Health"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(4);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.sports),
                    title: Text("Sports"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(5);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text("Technology"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(6);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.science),
                    title: Text("Science"),
                    onTap: () {
                      DefaultTabController.of(context)!.animateTo(7);
                      Get.back();
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  Text(""),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      Get.to(() => Settings());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.details),
                    title: Text("About"),
                    onTap: () {
                      Get.to(() => About());
                    },
                  ),
                ],
              )),
              appBar: AppBar(
                title: Container(
                  padding: EdgeInsets.only(right: 30),
                  width: 300,
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {}, child: Icon(Icons.search)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      hintText: "Search news ...",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                actions: [
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 15, right: 25),
                          child: Icon(
                            Icons.notification_add,
                            color: Colors.red,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(left: 23),
                        child: Text(
                          "${appState.allNews.length}",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black87),
                backgroundColor: Colors.white70,
                bottom: TabBar(
                  indicatorColor: Colors.green,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabs: [
                    for (var item in listoftabstitle)
                      Tab(
                        child: item,
                      ),
                  ],
                ),
              ),
              body: Body(),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: 1,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: GestureDetector(
                          onTap: () async {
                            await appState.getAllnews();
                            DefaultTabController.of(context)!.animateTo(0);
                          },
                          child: Icon(
                            Icons.home,
                            size: 40,
                            color: Colors.deepPurple,
                          )),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: GestureDetector(
                          onTap: () async {
                            Get.to(Favorite());
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 40,
                            color: Colors.redAccent,
                          )),
                    ),
                    label: '',
                  ),
                ],
              ),
            );
          })),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Home(),
      Business(),
      Entertainment(),
      General(),
      Health(),
      Sport(),
      Technology(),
      Science(),
    ]);
  }
}
