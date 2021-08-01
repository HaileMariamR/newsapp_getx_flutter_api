import 'package:flutter/rendering.dart';

class News {
  String? url;
  String? title;
  String? urlToImage;

  News({this.urlToImage, this.title, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      url: json['url'],
      urlToImage: json['urlToImage'],
      title: json['title'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "url": url,
      "urlToImage": urlToImage,
      "title": title,
    };
  }
}
