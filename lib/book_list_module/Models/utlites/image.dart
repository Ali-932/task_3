import 'package:flutter/cupertino.dart';

class imagee extends StatelessWidget {
  imagee({Key? key,required this.imagelink}) : super(key: key);
  String imagelink;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: 72,
        height: 106,
        child: Image.network(imagelink),
        
      ),
    );
  }
}
