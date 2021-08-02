import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:newsapp/data/appdatabase.dart';
import 'package:newsapp/data/newsmodel.dart';

class AppState extends GetxController {
  var allNews = [].obs;
  var businessnews = [].obs;
  var entertainmentnews = [].obs;
  var generalnews = [].obs;
  var healthnews = [].obs;
  var sportsnews = [].obs;
  var technologynews = [].obs;
  var sciencenews = [].obs;
  var searchResult = [].obs;

  var count = 0.obs;
  var isfetching = false.obs;
  var x = 6.obs;

  var favouriteNews = [].obs;

  @override
  void onInit() async {
    allNews.value = await getAllnews();
    count.value = allNews.value.length;
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

        for (var item in tempresult['articles']) {
          item['favourite'] = 0xff212121;
        }

        finalresult = tempresult['articles'];
      }
    } catch (e) {}

    isfetching.value = false;
    print("finish fetching");
    return finalresult;
  }

  Future<void> searchNews(String input) async {
    isfetching.value = true;
    var finalsearchresult = [];
    try {
      http.Response searchResponse = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=${input}&apiKey=28b97d72f5144c86ba7d64a9e9892654"));

      if (searchResponse.statusCode == 200) {
        var tempresult = jsonDecode(searchResponse.body);
        finalsearchresult = tempresult['articles'];
        searchResult.value = finalsearchresult;
      }
    } catch (e) {
      print(e);
    }
    isfetching.value = false;
  }

  Future<void> addtofavourite(News news) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        news.url.toString(), json.encode(news.tojson()));
  }

  Future<void> getfavourite() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Set allkeys = sharedPreferences.getKeys();

    List<dynamic> favnews = [];
    Set allKeys = sharedPreferences.getKeys();
    if (allKeys.isNotEmpty) {
      for (int i = 0; i < allKeys.length; i++) {
        String key = (allKeys.elementAt(i).toString());
        Object? value = sharedPreferences.get(key);
        dynamic json = jsonDecode(value.toString());

        favnews.add(json);
      }
    }
    favouriteNews.value = favnews;
  }
}
