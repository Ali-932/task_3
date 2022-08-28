import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/View_controller.dart';
import '../../controllers/cart_controller.dart';

class Nav extends StatelessWidget {
  const Nav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Transform.scale(
      scale: 1.1,
      child: Container(
        margin: EdgeInsets.only(bottom: 30),
        width: 227,
        height: 72,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 7,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: GetX<view_controller>(builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    controller.ViewController.animateToPage(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  },
                  icon: Icon(
                    Icons.home,
                    color: controller.onPageChange == 0
                        ? Colors.black
                        : Colors.black38,
                  )),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.ViewController.animateToPage(1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut);
                      },
                      icon: Icon(Icons.shopping_cart,
                          color: controller.onPageChange == 1
                              ? Colors.black
                              : Colors.black38)),
                     GetBuilder<CartController>(
                       builder: (controller) {
                         print(controller.count.value);
                         return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 24,top: 10),
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Text(
                              '${controller.count.value}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                    );
                       }
                     )
                ],
              ),
              IconButton(
                  onPressed: () {
                    controller.ViewController.animateToPage(2,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  },
                  icon: Icon(Icons.add,
                      color: controller.onPageChange == 2
                          ? Colors.black
                          : Colors.black38))
            ],
          );
        }),
      ),
    );
  }
}
