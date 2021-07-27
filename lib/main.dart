import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/Homepage.dart';

void main() {
  runApp(GetMaterialApp(
    title: "New App",
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}
