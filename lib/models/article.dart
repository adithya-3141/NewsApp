class Article {
  String title;
  String description;
  String urlToImage;
  String publishedAt;
  String url;

  Article(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
      required this.url});

  factory Article.fromJson(dynamic json) {
    return Article(
        title: json['title'] as String,
        description: json['description'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] as String,
        url: json['url'] as String);
  }

  static List<Article> articleFromArray(List? array) {
    return array!.map((data) {
      return Article.fromJson(data);
    }).toList();
  }
}
