import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Booklist.dart';
import '../Models/Reviews.dart';
import '../Services/reviews_remote.dart';

class Review_controller extends GetxController{
  final booklist book;
  Review_controller({required this.book});
  final title_controller = TextEditingController();
  final body_controller = TextEditingController();
  RxDouble rating=(0.toDouble()).obs;
  RxDouble Totalratings=(0.toDouble()).obs;
  RxList<Reviews> reviews = <Reviews>[].obs;
  double get ratings => reviews.fold(0, (sum, item) => sum + item.rating);

  @override
  void onInit() {
    initReviews();
    initalReview();
    super.onInit();
  }
  Future<void> initReviews()  async {
    try {
      var products = await ReviewServices.fetchProducts(book.bookName);
      if (products != null) {
        reviews.value = products["Reviews"];
        Totalratings.value=products["count"].toDouble();
      }
      else
        print('error');
    } finally {
    }

  }

  void initalReview(){
    book.reviews.forEach((e) {
      reviews.value.add(e);
    });
  }
  void AddReviews(Reviews r){
    ReviewServices.makePostRequest(r, book.bookName);

    book.reviews.add(r);
    reviews.add(r);
  }
  double BookRating(){
    print('ratings $ratings');
    return Totalratings/book.reviews.length;
  }


}