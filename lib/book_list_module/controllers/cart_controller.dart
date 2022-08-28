import 'package:get/state_manager.dart';

import '../Models/Booklist.dart';
class CartController extends GetxController {
   static var cartItems = <booklist>[].obs;
   RxBool hovering=false.obs;
   RxInt get count => (cartItems.length).obs;
   double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
}
