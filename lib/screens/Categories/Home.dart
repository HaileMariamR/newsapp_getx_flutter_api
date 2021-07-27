import 'package:flutter/material.dart';
import 'package:newsapp/appState/AppState.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appState = Get.put(AppState());

    return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: appState.allNews
              .map(
                (article) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: EdgeInsets.all(2),
                  child: Card(
                    color: Colors.blueAccent,
                    child: Image.network((article['urlToImage'] != null)
                        ? article['urlToImage']
                        : "https://i.pinimg.com/564x/1b/b0/48/1bb048ecbd3c4e6637d06a035893498e.jpg"),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
