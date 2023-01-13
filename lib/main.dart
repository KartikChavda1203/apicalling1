import 'package:apicalling1/screens/view/addproducts.dart';
import 'package:apicalling1/screens/view/buttonScreens.dart';
import 'package:apicalling1/screens/view/homeScreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ButtonScreens(),
        '/home': (context) => HomeScreens(),
        'add': (context) => AddProducts(),
      },
    ),
  );
}
