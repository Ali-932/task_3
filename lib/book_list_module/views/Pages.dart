import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_3/book_list_module/views/BookPage.dart';

import '../controllers/Book_controller.dart';
import '../controllers/Book_list_controller.dart';
import '../controllers/Review_controller.dart';
import '../controllers/Text_field_controller.dart';
import 'navigations/Navigator.dart';

class pages extends StatelessWidget {
  const pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldC = Get.find<TextFieldController>();
    Get.delete<bookContoller>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 46, left: 4),
          child: const Text(
            'Book List',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
            child: GetX<Books_controller>(
              builder: (controller) {
                return ListView(
                    physics: BouncingScrollPhysics(),
                    children: controller.books.value.where((x) => x.bookName.toLowerCase().contains(textFieldC.query.toLowerCase()))
                        .map((e) => Container(
                      child: Row(
                        children: [
                          Container(
                             margin: EdgeInsets.only(bottom: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(Book_page(book: e));
                                },
                                child: Hero(tag: e.bookName,
                                child: e.image),
                              ),
                            ),
                          ),
                          Container(
                            height: 106,
                            margin: EdgeInsets.only(left: 26,top: 0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.to(Book_page(book: e,));
                                    },
                                    child: Text(
                                      e.bookName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    e.authorName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12,
                                        color:
                                        Colors.black.withOpacity(0.5)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Text(
                                    '\$${e.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                                Obx(()
                                   {
                                    return RatingBarIndicator(
                                      rating:
                                      e.rating.value,
                                      itemBuilder:
                                          (context, index) =>
                                          Icon(
                                            Icons
                                                .star,
                                            color: Colors
                                                .amber,
                                          ),
                                      itemCount:
                                      5,
                                      itemSize:
                                      20,
                                      direction:
                                      Axis.horizontal,
                                    );
                                  }
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                        .toList());
              }
            ),
        ),

       ]
                );

  }
}

