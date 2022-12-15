import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/articleApi.dart';
import 'package:news_app/widget/news_card.dart';

List<Article>? article;
bool isLoading = true;

class Homewindow extends StatefulWidget {
  const Homewindow({Key? key}) : super(key: key);

  @override
  State<Homewindow> createState() => _HomewindowState();
}

class _HomewindowState extends State<Homewindow> {
  getArticle() async {
    article = await apicall();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.newspaper),
            SizedBox(
              width: 10,
            ),
            Text("Newspaper"),
          ],
        ),
      ),
      body: (article == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                          imageurl: article![index].urlToImage,
                          title: article![index].title);
                    },
                    itemCount: listResponse!.length,
                  ),
                ],
              ),
            ),
    );
  }
}

// api key
//d2259c3d1020450fb40a67bbd9c011c6

// url
//https://newsapi.org/v2/everything?domains=timesnownews.com&apiKey=d2259c3d1020450fb40a67bbd9c011c6
