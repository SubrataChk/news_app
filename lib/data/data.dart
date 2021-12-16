import 'dart:convert';

import 'package:new_app/model/newsModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<NewsModel> dataStore = [];
  Future getNews() async {
    // ignore: unused_local_variable

    final urlLink =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=f62194bd2b334614b9dff8bbe9f1cc70";
    http.Response response = await http.get(Uri.parse(urlLink));
    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          NewsModel newsModel = NewsModel(
              title: element["title"],
              urlToimage: element["urlToImage"],
              description: element["description"],
              url: element["url"]);
          dataStore.add(newsModel);
        }
      });
    }
  }
}

///Category

class CategoryService {
  List<NewsModel> dataStore = [];
  Future getNews(String category) async {
    // ignore: unused_local_variable

    final urlLink =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f62194bd2b334614b9dff8bbe9f1cc70";
    http.Response response = await http.get(Uri.parse(urlLink));
    var jsondata = jsonDecode(response.body);

    if (jsondata["status"] == "ok") {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          NewsModel newsModel = NewsModel(
              title: element["title"],
              urlToimage: element["urlToImage"],
              description: element["description"],
              url: element["url"]);
          dataStore.add(newsModel);
        }
      });
    }
    print(jsondata);
  }
}
