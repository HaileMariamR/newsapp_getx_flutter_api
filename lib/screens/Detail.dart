import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:newsapp/data/newsmodel.dart';
import 'package:newsapp/screens/Favourite.dart';
import 'package:share_plus/share_plus.dart';
import 'package:newsapp/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newsapp/appState/AppState.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);
  String url = "";

  void launchonBrowser() async {
    await canLaunch(url) ? await launch(url) : throw "sorry, faild to launch.";
  }

  @override
  Widget build(BuildContext context) {
    var newsDetail = Get.arguments;
    AppState appstate = Get.find();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    Share.share("${newsDetail['url']}");
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: MediaQuery.of(context).size.height / 1.5,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${(newsDetail['source'] != null)?newsDetail['source']['name'] :""}'),
              background: Hero(
                tag: "HeroImage${(newsDetail['title'].toString() != null)?newsDetail['title'].toString():""}",
                child: Container(
                  child: Image.network(
                    (newsDetail['urlToImage'] != null)
                        ? newsDetail['urlToImage']
                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROGVlwDhbC-6RixbdgEwDrABJ6BD3hhM2eJA&usqp=CAU",
                    errorBuilder:
                        (context, Object exception, StackTrace? stackTrace) {
                      return const Text('Sorry Image not found ');
                    },
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "published at:  ${(newsDetail['publishedAt'] != null) ? newsDetail['publishedAt'] : ""}",
                      style: KdateStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: RichText(
                        text: TextSpan(
                            children: [
                          TextSpan(
                              text: newsDetail['title'],
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                            text: "Title : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: RichText(
                        text: TextSpan(
                            children: [
                          TextSpan(
                              text: (newsDetail['description'] != null)
                                  ? newsDetail['description']
                                  : "",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                            text: "Description : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: RichText(
                        text: TextSpan(
                            children: [
                          TextSpan(
                              text: (newsDetail['content'] != null)
                                  ? newsDetail['content']
                                  : "",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                            text: "Content : ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Author:  ${(newsDetail['author'] != null) ? newsDetail['author'] : ""}",
                      style: KdateStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await appstate.addtofavourite(
                        News(
                          url: newsDetail['url'],
                          title: newsDetail['title'],
                          urlToImage: newsDetail['urlToImage'],
                        ),
                      );

                      await appstate.getfavourite();
                      Get.snackbar(
                          "Favourite", "sucessfully added to favourite",
                          colorText: Colors.white,
                          backgroundColor: Colors.black);

                      Get.to(() => Favourite());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pink,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Add to favourite",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      url = newsDetail['url'];
                      launchonBrowser();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Get Full Coverage",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              childCount: 1,
            ), //SliverChildBuildDelegate
          ) //SliverLis
        ],
      ),
    );
  }
}
