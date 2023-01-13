import 'package:apicalling1/screens/controller/homeController.dart';
import 'package:apicalling1/screens/dbHelper.dart';
import 'package:apicalling1/screens/view/homeScreens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  TextEditingController txtName = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  Homecontroller homecontroller = Homecontroller();

  void getData() async {
    DbHelper db = DbHelper();
  }
  @override

  void initState() {
    super.initState();
    Get.put(HomeScreens());
  }

  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: IconButton(
                onPressed: () {
                  Get.to(HomeScreens());
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blueAccent,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtName,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Products Name",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),),
                  suffixIcon: Icon(Icons.close),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtprice,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.black26),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blueAccent),),
                  suffixIcon: Icon(Icons.close),
                  prefixIcon: Icon(Icons.attach_money),
                  prefixStyle: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    DbHelper db = DbHelper();
                    db.insertData(txtName.text, txtprice.text);
                    getData();
                    Get.back();
                  },
                    child: Text("CONTINUE"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff0D47A1)),)),
            ),
          ],
        ),
      ),
    );
  }
}
