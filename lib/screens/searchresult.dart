import 'package:flutter/material.dart';
import 'package:newsapp/appState/AppState.dart';
import 'package:get/get.dart';
import 'package:newsapp/screens/Favourite.dart';
import 'package:newsapp/utilities/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapp/screens/Detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key}) : super(key: key);
  var mycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppState appstate = Get.find();

    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(right: 30),
            width: 300,
            height: 30,
            child: TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      appstate.searchNews("${mycontroller.text}");
                    },
                    child: Icon(Icons.search)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                hintText: "Search news ...",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white70,
        ),
        body: Container(
            margin: EdgeInsets.only(top: 10),
            child: Obx(
              () => (appstate.isfetching == true)
                  ? SpinKitRing(
                      color: Colors.black26,
                      size: 50,
                    )
                  : ListView.builder(
                      itemCount: appstate.searchResult.length,
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
                                        "HeroImage${appstate.searchResult[index]['title'].toString()}",
                                    child: Image.network(
                                      (appstate.searchResult[index]
                                                  ['urlToImage'] !=
                                              null)
                                          ? appstate.searchResult[index]
                                              ['urlToImage']
                                          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGVlwDhbC-6RixbdgEwDrABJ6BD3hhM2eJA&usqp=CAU",
                                      errorBuilder: (context, Object exception,
                                          StackTrace? stackTrace) {
                                        return const Text(
                                            'Sorry! Image not found ');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "${appstate.searchResult[index]['title']}",
                                    style: karticletitlestyle,
                                  )),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        margin:
                                            EdgeInsets.only(left: 140, top: 0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => Detail(),
                                                arguments: appstate
                                                    .searchResult[index]);
                                          },
                                          child: Text(
                                            "more..",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                            ]),
                          ),
                        );
                      }),
            )));
  }
}
