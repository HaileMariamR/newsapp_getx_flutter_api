import 'dart:convert';

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

  var isfetching = false.obs;
  var x = 6.obs;
  @override
  void onInit() async {
    allNews.value = await getAllnews();
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
          "https://newsapi.org/v2/top-headlines?country=us&${input}&apiKey=2b5067c486444216811881c455e42588"));
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
