import 'package:apicalling1/screens/view/homeScreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonScreens extends StatefulWidget {
  const ButtonScreens({Key? key}) : super(key: key);

  @override
  State<ButtonScreens> createState() => _ButtonScreensState();
}

class _ButtonScreensState extends State<ButtonScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Read"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Add to Sql"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(HomeScreens());
              },
              child: Text("Next"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
