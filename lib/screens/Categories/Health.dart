import 'package:flutter/material.dart';
import 'package:newsapp/appState/AppState.dart';
import 'package:get/get.dart';
import 'package:newsapp/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus_linux/share_plus_linux.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newsapp/screens/Detail.dart';

class Health extends StatelessWidget {
  const Health({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppState appstate = Get.find();
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Obx(
          () => (appstate.isfetching == true)
              ? SpinKitRing(
                  color: Colors.black26,
                  size: 50,
                )
              : ListView.builder(
                  itemCount: appstate.healthnews.length,
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
                              child: Hero(
                                tag:
                                    "HeroImage${appstate.healthnews[index]['title'].toString()}",
                                child: Image.network(
                                  (appstate.healthnews[index]['urlToImage'] !=
                                          null)
                                      ? appstate.healthnews[index]['urlToImage']
                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGVlwDhbC-6RixbdgEwDrABJ6BD3hhM2eJA&usqp=CAU",
                                  errorBuilder: (context, Object exception,
                                      StackTrace? stackTrace) {
                                    return const Text('Sorry Image not found ');
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "${appstate.healthnews[index]['title']}",
                                style: karticletitlestyle,
                              )),
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 140),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.to(() => Detail(),
                                            arguments:
                                                appstate.healthnews[index]);
                                      },
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
