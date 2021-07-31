import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AppState extends GetxController {
  var allNews = [].obs;
  var businessnews = [].obs;
  var entertainmentnews = [].obs;
  var generalnews = [].obs;
  var healthnews = [].obs;
  var sportsnews = [].obs;
  var technologynews = [].obs;
  var sciencenews = [].obs;

  var count = 0.obs;
  var isfetching = false.obs;
  var x = 6.obs;

  var isfavouriteIconClicked = false.obs;

  var favouriteColor = 0xff009688.obs;

  void setFavouriteColor() {
    favouriteColor.value = 0xffE91E63;
  }

  @override
  void onInit() async {
    allNews.value = await getAllnews();
    count = RxInt(allNews.length);
    businessnews.value = await getAllnews(input: "category=business");
    entertainmentnews.value = await getAllnews(input: "category=entertainment");
    generalnews.value = await getAllnews(input: "category=general");
    healthnews.value = await getAllnews(input: "category=health");
    sportsnews.value = await getAllnews(input: "category=sports");
    technologynews.value = await getAllnews(input: "category=technology");
    sciencenews.value = await getAllnews(input: "category=science");

    super.onInit();
  }

  Future getAllnews({String? input}) async {
    isfetching.value = true;
    var finalresult = [];
    print("start fetching");
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&${input}&apiKey=28b97d72f5144c86ba7d64a9e9892654"));
      if (response.statusCode == 200) {
        var tempresult = jsonDecode(response.body);
        finalresult = tempresult['articles'];
      }
    } catch (e) {}

    isfetching.value = false;
    print("finish fetching");
    return finalresult;
  }
}
