// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:new_app/data/categoryData.dart';
import 'package:new_app/data/data.dart';
import 'package:new_app/model/categorymodel.dart';
import 'package:new_app/model/newsModel.dart';
import 'package:sizer/sizer.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  CategoryPage({required this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<NewsModel>? news = [];
  bool _loading = true;

  getNew() async {
    CategoryService newsData = CategoryService();
    await newsData.getNews(
      widget.category,
    );
    news = newsData.dataStore;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getNew();
    });
  }

  @override
  Widget build(BuildContext context) {
    getNew();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 33),
        backgroundColor: Colors.white,
        title: Text(
          widget.category.toUpperCase(),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )
              : Container(
                  // height: 100,

                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: news!.length,
                      itemBuilder: (context, index) {
                        return NewsBlog(
                          urltoImage: news![index].urlToimage!,
                          title: news![index].title!,
                          description: news![index].description!,
                        );
                      }),
                ),
        ),
      ),
    );
  }
}

class NewsBlog extends StatelessWidget {
  final String title;
  final String urltoImage;
  final String description;

  NewsBlog(
      {required this.title,
      required this.urltoImage,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: urltoImage,
                height: 30.h,
                width: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                description,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
