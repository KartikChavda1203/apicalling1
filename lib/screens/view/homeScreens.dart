import 'package:apicalling1/screens/controller/homeController.dart';
import 'package:apicalling1/screens/modal/Apicalling.dart';
import 'package:apicalling1/screens/view/addproducts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Homecontroller homecontroller = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black12,
          leading: InkWell(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.widgets,color: Colors.redAccent,),),
              ],
            ),
          ),
          title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
          centerTitle: true,
          actions: [
            InkWell(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.shopping_basket,color: Colors.redAccent,),),
                ],
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.person,color: Colors.redAccent,),),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: homecontroller.apicalling(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
            {
              return Text("error ${snapshot.error}");
            }
            else if (snapshot.hasData) {
              List modaldata = snapshot.data!;
              return  Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 35,
                          width: 150,
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Search...",style: TextStyle(color: Colors.black26,fontSize: 12),),
                              ),
                              IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black26,size: 12,))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.tune,color: Colors.white,),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             // Text("${l2[index]}"),
                             // Text("${l1[index]}"),
                            ],
                          ),
                        ),
                      );
                    },),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                        Text("View All",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w600,fontSize: 10),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: modaldata.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Image.network("${modaldata[index].image}"),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Text("${modaldata[index].title}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                ),
                                SizedBox(height: 2,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Text("${modaldata[index].price}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                ),

                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
          }
            return CircularProgressIndicator();
          },
        ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.to(AddProducts());
            },
            label: Text("ADD PRODUCTS"),
            icon: Icon(Icons.person_add),
            backgroundColor: Color(0xff000000),
          ),

      ),
    );
  }
}