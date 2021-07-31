import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 100, left: 20),
          child: Text(
            "an app that shows news by categories.",
            style: TextStyle(
              color: Colors.pink,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
