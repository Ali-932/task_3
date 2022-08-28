import 'package:flutter/material.dart';
import 'Home_utlites.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      backgroundColor: const Color(0xffE5E5E5),
      body: Pagevi(),

    );
  }
}



