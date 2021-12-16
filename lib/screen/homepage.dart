import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/data/categoryData.dart';
import 'package:new_app/data/data.dart';
import 'package:new_app/model/categorymodel.dart';
import 'package:new_app/model/newsModel.dart';
import 'package:new_app/screen/categorypage.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel>? categories = [];
  List<NewsModel>? news = [];
  bool _loading = true;

  getNew() async {
    ApiService newsData = ApiService();
    await newsData.getNews();
    news = newsData.dataStore;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DEV",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Text(
              "NEWS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blueAccent),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 14.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories!.length,
                          itemBuilder: (context, index) {
                            return CategoryDetails(
                                categoryName: categories![index].categoryName!,
                                img: categories![index].imgUrl!);
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
    );
  }
}

class CategoryDetails extends StatelessWidget {
  final String categoryName;
  final String img;
  CategoryDetails({required this.categoryName, required this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.only(right: 18),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: img,
                height: 14.h,
                width: 42.w,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 14.h,
              width: 42.w,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
            )
          ],
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
