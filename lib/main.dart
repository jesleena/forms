import 'package:flutter/material.dart';
import 'package:myforms/form_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormScreen(),
    initialRoute:'form_screen' ,
    routes: {
      FormScreen.id: (context) => FormScreen(),
    },);
  }
}
