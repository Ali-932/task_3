import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/View_controller.dart';
import 'Add_book.dart';
import 'Cart.dart';
import 'Pages.dart';
import 'SearchBar.dart';
import 'navigations/Navigator.dart';
class Pagevi extends StatelessWidget {
  const Pagevi({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final View_controller=Get.find<view_controller>();
    return Stack(
      children: [
        PageView(
          onPageChanged: (x){
            View_controller.onPageChange.value=x;
          },
          controller: View_controller.ViewController,
          children: [
            Home_page_utlites(),
            cart(),
            Add()

          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Nav(),
        ) ],
    );
  }
}

class Home_page_utlites extends StatelessWidget {
  const Home_page_utlites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 28, right: 28, top: 43, bottom: 47),
      child: Column(children: [
        Row(children: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                  'https://cdn.lorem.space/images/face/.cache/150x150/jake-fagan-Y7C7F26fzZM-unsplash.jpg'),
            ),
          ),
          Text(
            'Hi, Ali!',
            style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.none,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 18,
          )
        ]),
        Container(
          margin: EdgeInsets.only(top: 38),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ]),
          child: searchBar(),
        ),
        Expanded(child: pages())
      ]),
    );
  }
}