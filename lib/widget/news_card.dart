import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String imageurl;
  final String title;

  const NewsCard({Key? key, required this.imageurl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(imageurl),
              const SizedBox(
                height: 20,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
