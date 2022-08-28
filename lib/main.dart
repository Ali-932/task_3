import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'book_list_module/controllers/Main_controllers.dart';
import 'book_list_module/controllers/Text_field_controller.dart';
import 'book_list_module/views/MyHomePage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldC=Get.find<TextFieldController>();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
          textFieldC.hint.value=true;
        }
      },

      child:GetMaterialApp(
        title: 'Book_eStore',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          fontFamily: 'Poppins'
        ),
        home:  HomePage(),
      ),
    );
  }
}

