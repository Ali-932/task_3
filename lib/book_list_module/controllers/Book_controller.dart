import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Booklist.dart';

class bookContoller extends GetxController{
  final booklist book;
  final RxBool more=true.obs;

  bookContoller({required this.book});

}