import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Booklist.dart';
import '../Models/Reviews.dart';

class Review_controller extends GetxController{
  final booklist book;
  Review_controller({required this.book});
  final title_controller = TextEditingController();
  final body_controller = TextEditingController();
  RxDouble rating=(0.toDouble()).obs;
  RxDouble Totalratings=(3.toDouble()).obs;
  RxList<Reviews> reviews = <Reviews>[].obs;
  @override
  void onInit() {
    initalReview();
    super.onInit();
  }
  void initalReview(){
    book.reviews.forEach((e) {
      reviews.value.add(e);
    });
  }
  void AddReviews(Reviews r){
    book.reviews.add(r);
    reviews.add(r);
  }
  double BookRating(){
    print('total rating ${Totalratings}');
    print('avg rating ${Totalratings/book.reviews.length}');
    print('book rating ${book.rating}');
    return Totalratings/book.reviews.length;
  }


}