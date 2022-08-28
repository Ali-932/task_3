import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{
  var hint = true.obs;
  final serachController = TextEditingController();
  RxString query=''.obs;


}