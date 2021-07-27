import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            height: 35,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
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
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: TextField(
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(color: Colors.black, width: 10.0),
        //       ),
        //       hintText: "Search news ...",
        //       focusedBorder: InputBorder.none,
        //       hintStyle: TextStyle(
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        );
  }
}
