import 'dart:math';
import 'dart:convert';


import 'Reviews.dart';
import 'utlites/image.dart';
import 'package:get/get.dart';
class booklist{

  String bookName;
  String authorName;
  double price;
  String link;
  imagee image;
  String descriotions;
  RxDouble rating;
  bool isRated;
  List<Reviews> reviews;
  booklist({required this.bookName,required this.authorName,required this.price,
  required this.link,required this.descriotions,required this.rating,required this.isRated})
  : image= imagee(imagelink: link),
    reviews=[];

  static List<booklist> bookFromJson(String str) =>
      List<booklist>.from(json.decode(str).map((x) => booklist.fromJson(x)));

  String toRawJson() => json.encode(toJson());

  factory booklist.fromJson(Map<String, dynamic> json) => booklist(
    bookName: json["bookName"],
    authorName: json["authorName"],
    price: double.parse(json["price"]),
    link: json["link"],
    descriotions: json["description"],
    rating: double.parse(json["rating"]).obs,
    isRated: json["isRated"]=='true',
  );

  Map<String, dynamic> toJson() => {
    "bookName": bookName,
    "authorName": authorName,
    "price": price,
    "link": link,
    "description": descriotions,
    "rating": rating,
    "isRated": isRated,
  };
}
