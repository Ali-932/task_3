import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Booklist.dart';
import '../Services/book_list_remote.dart';

class Books_controller extends GetxController{

  RxList<booklist> books = <booklist>[].obs;
  final bookName=TextEditingController();
  final Author_controller=TextEditingController();
  final price_controller=TextEditingController();
  final link_controller=TextEditingController();
  final description_controller=TextEditingController();
  @override
  void onInit() {
    AddBooks();
    super.onInit();
  }
  Future<void> AddBooks()  async {
      try {
        var products = await RemoteServices.fetchProducts();
        if (products != null) {
          books.value = products as List<booklist>;
        }
      } finally {
      }

  }
  void Add(String name,String Author,String price,String link,String description){
    double dprice=double.parse(price);
    bookName.clear();
    Author_controller.clear();
    price_controller.clear();
    link_controller.clear();
    description_controller.clear();
  }
  // void AddReview(String review,booklist book){
  //   book.review.add(review);
  //
  // }
}
