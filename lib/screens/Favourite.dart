import 'package:flutter/material.dart';
import 'package:newsapp/appState/AppState.dart';
import 'package:get/get.dart';
import 'package:newsapp/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus_linux/share_plus_linux.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newsapp/screens/Detail.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appstate = Get.find();
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Obx(
          () => ListView.builder(
              itemCount: appstate.favouriteNews.length,
              itemBuilder: (context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  margin: EdgeInsets.all(2),
                  child: Card(
                    elevation: 4,
                    child: Column(children: [
                      Container(
                        child: Expanded(
                          child: Image.network(
                            (appstate.favouriteNews[index]['urlToImage'] !=
                                    null)
                                ? appstate.favouriteNews[index]['urlToImage']
                                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGVlwDhbC-6RixbdgEwDrABJ6BD3hhM2eJA&usqp=CAU",
                            errorBuilder: (context, Object exception,
                                StackTrace? stackTrace) {
                              return const Text('Sorry Image not found ');
                            },
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "${appstate.favouriteNews[index]['title']}",
                            style: karticletitlestyle,
                          )),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        "${appstate.favouriteNews[index]['url']}");
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 140),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "view detail",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ]),
                  ),
                );
              }),
        ));
  }
}
