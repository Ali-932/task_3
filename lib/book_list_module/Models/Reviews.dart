import 'dart:convert';

class Reviews {
  final String title;
  final String body;
  final double rating;
  Reviews({required this.rating,required this.title,required this.body});

  static List<Reviews> Revewfromjson(String str) =>
      List<Reviews>.from(json.decode(str)["Review"].map((x) => Reviews.fromJson(x)));
  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    title: json["title"],
    body: json["body"],
    rating: double.parse(json["rating"]),
  );
  String toRawJson(String bookname) => json.encode(toJson(bookname));
  Map<String, dynamic> toJson(String bookname) => {
    "title": title,
    "body": body,
    "rating": rating,
    "bookname": bookname
  };

}