import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:readmore/readmore.dart';

import '../Models/Booklist.dart';
import 'package:get/get.dart';

import '../Models/Reviews.dart';
import '../controllers/Book_controller.dart';
import '../controllers/Book_list_controller.dart';
import '../controllers/Review_controller.dart';
import '../controllers/View_controller.dart';
import '../controllers/cart_controller.dart';
import 'MyHomePage.dart';

class Book_page extends StatelessWidget {
  const Book_page({Key? key, required this.book}) : super(key: key);
  final booklist book;

  @override
  Widget build(BuildContext context) {
    final Bookcontroller = Get.put(bookContoller(book: book));
    final cartController = Get.find<CartController>();
    final View_controller = Get.find<view_controller>();
    final ReviewC = Get.put(Review_controller(book: book));

    return Scaffold(
      appBar: null,
      backgroundColor: const Color(0xffE5E5E5),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 43, left: 28, right: 28),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          cartController.update();
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.chevron_left,
                          color: Color(0xff06070D),
                          size: 40,
                        )),
                    Icon(Icons.more_vert, color: Color(0xff06070D), size: 18),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  width: 216,
                  height: 320,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(tag: book.bookName, child: book.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    book.bookName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    book.authorName,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                GetX<bookContoller>(builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBarIndicator(
                          rating:
                          book.rating.value,
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
                          15,
                          direction:
                          Axis.horizontal,
                        ),
                        Text(
                          '${book.rating}/5.0',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: ReadMoreText(
                    callback: (x) {
                      Bookcontroller.more.value = x;
                      print(x);
                    },
                    book.descriotions,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    trimLines: 5,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent),
                    trimExpandedText: ' Show less',
                    delimiterStyle: TextStyle(color: Colors.deepPurpleAccent),
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Utlites_container(
                          icon: Icons.align_horizontal_left,
                          text: 'Preview',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  customHeader: book.image,
                                  dialogType: DialogType.QUESTION,
                                  width: 600,
                                  buttonsBorderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  dismissOnTouchOutside: true,
                                  dismissOnBackKeyPress: false,
                                  body: Container(
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 12),
                                          child: Container(
                                            child: SingleChildScrollView(
                                              child: GetX<Review_controller>(
                                                  builder: (controller) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: controller.reviews
                                                      .map((e) => Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(top:20),
                                                                      child: Container(
                                                                        child:
                                                                            Text(
                                                                          '${e.title}',
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.white,
                                                                              fontSize: 30),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10,top:17),
                                                                      child: RatingBarIndicator(
                                                                        rating:
                                                                            e.rating,
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
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 6),
                                                                  child: Container(
                                                                    child: Text(
                                                                      e.body,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white70,
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                )
                                                              ]))
                                                      .toList(),
                                                );
                                              }),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: Review_text(
                                            ReviewC: ReviewC.title_controller,
                                            hint: 'Name',
                                            maxlines: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Review_text(
                                            ReviewC: ReviewC.body_controller,
                                            hint: 'Review',
                                            maxlines: 3,
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              itemSize: 25,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: book.isRated == false
                                                    ? Colors.amber
                                                    : Colors.blue,
                                              ),
                                              onRatingUpdate: (rating) {
                                                book.isRated = true;
                                                ReviewC.rating.value = rating;
                                                print('rating $rating');
                                              },
                                            ),
                                          ),
                                        ),

                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: TextButton(
                                                onPressed: () {
                                                  print(ReviewC.BookRating());
                                                  ReviewC.Totalratings.value+=ReviewC.rating.value;
                                                  ReviewC.reviews.add(Reviews(
                                                      body: ReviewC
                                                          .body_controller.text,
                                                      title: ReviewC
                                                          .title_controller.text,
                                                      rating: ReviewC.rating.value));
                                                  book.reviews.add(Reviews(
                                                      body: ReviewC
                                                          .body_controller.text,
                                                      title: ReviewC
                                                          .title_controller.text,
                                                      rating: ReviewC.rating.value));
                                                  book.rating.value=ReviewC.BookRating();
                                                  Get.snackbar("Add review",
                                                      "${book.bookName} review has been added",
                                                      icon: const Icon(Icons.reviews,
                                                          color: Colors.white),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      backgroundColor: Colors.black,
                                                      borderRadius: 20,
                                                      margin: EdgeInsets.all(15),
                                                      colorText: Colors.white,
                                                      duration:
                                                          Duration(seconds: 2),
                                                      isDismissible: true,
                                                      forwardAnimationCurve:
                                                          Curves.easeOutBack,
                                                      dismissDirection:
                                                          DismissDirection
                                                              .horizontal);
                                                  ReviewC.title_controller.clear();
                                                  ReviewC.body_controller.clear();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    'Add Review',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 17),
                                                  ),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  headerAnimationLoop: false,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: 'Reviews',
                                  desc: 'Write your review bellow',
                                  showCloseIcon: true,
                                ).show();
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Utlites_container(
                                icon: Icons.comment,
                                text: 'Reviews',
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 12,
            left: (MediaQuery.of(context).size.width) / 10 - 2,
            child: add_to_cart(cartController: cartController, book: book)),
      ]),
    );
  }
}

class Review_text extends StatelessWidget {
  final int maxlines;
  final String hint;
  const Review_text({
    Key? key,
    required this.ReviewC,
    required this.maxlines,
    required this.hint,
  }) : super(key: key);

  final TextEditingController ReviewC;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(fontSize: 16, color: Colors.black),
        maxLines: maxlines,
        controller: ReviewC,
        cursorColor: Colors.black38,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            filled: true,
            fillColor: Color(0xffFFFFFF),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black38),
            contentPadding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
  }
}

class add_to_cart extends StatelessWidget {
  const add_to_cart({
    Key? key,
    required this.cartController,
    required this.book,
  }) : super(key: key);

  final CartController cartController;
  final booklist book;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          CartController.cartItems.value.add(book);

          Get.snackbar(
              "Added to cart", "${book.bookName} has been added to cart",
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.black,
              borderRadius: 20,
              margin: EdgeInsets.all(15),
              colorText: Colors.white,
              duration: Duration(seconds: 2),
              isDismissible: true,
              forwardAnimationCurve: Curves.easeOutBack,
              dismissDirection: DismissDirection.horizontal);
        },
        child: Container(
          alignment: Alignment.center,
          width: 319,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(15)),
          child: Text(
            'Buy now for ${book.price}\$',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ));
  }
}

class Utlites_container extends StatelessWidget {
  final IconData icon;
  final String text;
  const Utlites_container({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
