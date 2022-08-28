import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/Book_controller.dart';
import '../controllers/Book_list_controller.dart';
import '../controllers/View_controller.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final View_controller = Get.find<view_controller>();
    final books_controller = Get.find<Books_controller>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        padding: EdgeInsets.only(left: 28, right: 28, top: 43, bottom: 47),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    View_controller.ViewController.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  },
                  icon: Icon(
                    Icons.chevron_left,
                    color: Color(0xff06070D),
                    size: 40,
                  )),
              Icon(Icons.more_vert, color: Color(0xff06070D), size: 18),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20,right: 20,bottom: 10),
            child: Text('Add a Book',style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),),
          ),
          TextFields(books_controller: books_controller,hint: 'Book Name',controller: books_controller.bookName,),
          TextFields(books_controller: books_controller,hint: 'Book Author',controller: books_controller.Author_controller,),
          TextFields(books_controller: books_controller,hint: 'Price',controller: books_controller.price_controller,),
          TextFields(books_controller: books_controller,hint: 'Image link',controller: books_controller.link_controller,),
          TextFields(books_controller: books_controller,hint: 'Description',controller: books_controller.description_controller,maxlines: 5,),
          TextButton(onPressed: (){
            Get.snackbar("Added to cart",
                "${books_controller.bookName.text} has been added to cart",
                icon: Icon(Icons.add, color: Colors.white),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.black,
                borderRadius: 20,
                margin: EdgeInsets.all(15),
                colorText: Colors.white,
                duration: Duration(seconds: 2),
                isDismissible: true,
                forwardAnimationCurve: Curves.easeOutBack,
                dismissDirection:DismissDirection.horizontal );

            books_controller.Add(books_controller.bookName.text, books_controller.Author_controller.text, books_controller.price_controller.text, books_controller.link_controller.text, books_controller.description_controller.text);
          }, child: Container(
            margin: EdgeInsets.only(left: 65,top: 10),
            width: 200,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black
            ),
            child: Text("ADD",style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w300
            ),


            ),
          ))

        ]
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final hint;
  final controller;
  final int? maxlines;
  const TextFields({
    Key? key,
    required this.books_controller, this.hint, this.controller, this.maxlines,
  }) : super(key: key);

  final Books_controller books_controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: TextField(
        style: TextStyle(fontSize: 16,color: Colors.black),
        maxLines:maxlines??1 ,
        controller: controller,
    cursorColor: Colors.black38,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    ),
    filled: true,
    fillColor: Color(0xffFFFFFF),
    hintText: hint,
    hintStyle: TextStyle(color: Colors.black38),
    contentPadding: EdgeInsets.only(left: 15,top:20,bottom: 20),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    )
    )
      ),
    );
  }
}
