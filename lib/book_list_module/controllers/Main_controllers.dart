import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Book_list_controller.dart';
import 'Text_field_controller.dart';
import 'View_controller.dart';
import 'cart_controller.dart';

Future<void> init() async {
  final BookC=Get.put(Books_controller());
  final textFieldC=Get.put(TextFieldController());
  final cartController=Get.put(CartController());
  final view=Get.put(view_controller());


}
