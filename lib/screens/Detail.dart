import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsDetail = Get.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${newsDetail['source']['name']}'),
              background: Hero(
                tag: "HeroImage${newsDetail['title'].toString()}",
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
              (context, index) => ListTile(
                tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                title: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          color: Colors.greenAccent[400]) //TextStyle
                      ), //Text
                ), //Center
              ), //ListTile
              childCount: 10,
            ), //SliverChildBuildDelegate
          ) //SliverLis
        ],
      ),
    );
  }
}
