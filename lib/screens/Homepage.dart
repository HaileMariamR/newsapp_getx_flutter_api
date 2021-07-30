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
                  child: Column(
                children: [
                  DrawerHeader(
                    child: Container(),
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
                  Container(
                      width: 20,
                      margin: EdgeInsets.only(right: 10),
                      child: TextButton(
                          onPressed: () {}, child: Icon(Icons.notifications)))
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
                            await appState.getAllnews(
                                input: "category=business");
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
