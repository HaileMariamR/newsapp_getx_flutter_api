import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final apiKey = "28b97d72f5144c86ba7d64a9e9892654";

class AppState extends GetxController {
  List allNews = [].obs;
  bool isfaching = false;

  Future<void> getAllnews() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=28b97d72f5144c86ba7d64a9e9892654"));
      if (response.statusCode == 200) {
        var finalresult = jsonDecode(response.body);
        allNews = finalresult['articles'];
      }
    } catch (e) {}
  }
}
