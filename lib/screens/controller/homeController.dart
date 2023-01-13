import 'dart:convert';
import 'dart:core';
import 'package:apicalling1/screens/modal/Apicalling.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController
{
  String apilink = "https://fakestoreapi.com/products";
  Future<List> apicalling()async
  {
    var jsonstring = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jsonstring.body);
    return json.map((e) => Apicalling.fromJson(e)).toList();
  }
}