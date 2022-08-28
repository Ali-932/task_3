import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controllers/Book_list_controller.dart';
import '../controllers/View_controller.dart';
import '../controllers/cart_controller.dart';
import 'BookPage.dart';
import 'MyHomePage.dart';

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final View_controller=Get.find<view_controller>();
    return Container(
      padding: EdgeInsets.only(left: 28, right: 28, top: 43, bottom: 47),

      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  View_controller.ViewController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                }, icon: Icon(Icons.chevron_left,color: Color(0xff06070D),size: 40,)),
                Icon(Icons.more_vert,color: Color(0xff06070D),size: 18),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child:Row(
                children: [
                  const Text(
                    'Cart',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20,bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Sub-Total',style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20
                                    ),),
                                    GetX<CartController>(
                                      builder: (contoller) {
                                        return Text('${contoller.count} items',style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black.withOpacity(0.5),
                                        ),);
                                      }
                                    )
                                  ],
                                ),
                              ),
                              GetX<CartController>(
                                builder: (contoller) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text('${contoller.totalPrice}\$',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                                  );
                                }
                              )
                            ],
                          ),
                          Container(
                            width: 125,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellowAccent
                            ),
                            child: Text('Checkout',style: TextStyle(
                              color: Colors.black,fontSize: 15
                            ),),
                          )
                        ],
                      ),
                    ),


                ],
              )

            ),
            Expanded(
              child: GetX<CartController>(
                  builder: (controller) {
                    return ListView(
                        physics: BouncingScrollPhysics(),
                        children: CartController.cartItems.value.map((e) => Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: e.image,
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
                          RatingBarIndicator(
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
                          )
                                  ],
                                ),
                              ),
                            GetX<CartController>(
                              builder: (controller) {
                                return Padding(
                                padding: const EdgeInsets.only(left: 30,bottom: 76),
                                child: IconButton(onPressed: (){
                                  CartController.cartItems.remove(e);
                                  Get.snackbar("Removed from cart",
                                      "${e.bookName} has been removed from cart",
                                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.deepOrange,
                                  borderRadius: 20,
                                  margin: EdgeInsets.all(15),
                                  colorText: Colors.white,
                                  duration: Duration(seconds: 2),
                                  isDismissible: true,
                                  forwardAnimationCurve: Curves.easeOutBack,
                                  dismissDirection:DismissDirection.horizontal);
                                },
                                    icon: Icon(Icons.highlight_remove_outlined,
                                    color: controller.hovering.value? Colors.red: Colors.black,)),
                                  );
                              }
                            )

                            ],

                          ),
                        ))
                            .toList());
                  }
              ),
            ),

          ]
      ),
    );

  }
}
