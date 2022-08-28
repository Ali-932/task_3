import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Text_field_controller.dart';

class searchBar extends StatelessWidget {
   searchBar({
    Key? key,
  }) : super(key: key);

  final textFieldC = Get.find<TextFieldController>();
  @override
  Widget build(BuildContext context) {
    return GetX<TextFieldController>(
        builder: (controller) {
          return TextField(
            controller: controller.serachController,
            onTap: (){
              controller.hint.value=false;
            },
            onSubmitted: (x){
            controller.query.value=x;
            },

            cursorColor: Colors.black38,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),

              filled: true,
              fillColor: Color(0xffFFFFFF),
              suffixIcon: Icon(Icons.search_outlined,color: Colors.black38,size: 30),
              hintText: controller.hint.value==true ? 'Serach...': ' ',
              hintStyle: TextStyle(color: Colors.black38),
              contentPadding: EdgeInsets.only(left: 15,right: 17,top:20,bottom: 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
            ),
          );
        }
    );
  }
}
