import 'dart:math';

import 'package:task_3/book_list_module/Models/utlites/random_generator.dart';

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
  required this.link,required this.descriotions})
  : image= imagee(imagelink: link),
    rating=(3.toDouble()).obs,
    isRated=false,
    reviews=[(Reviews(title: 'James franco', body: "Great book, had a lot of fun reading it", rating: 3,))];




}