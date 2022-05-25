import 'package:flutter_test_taks_card/Classes/card_class.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Controller extends GetxController{


  late String transactionId;
  late String shopName;
  late String shopLogo;
  late String paymentType;
  late String timestamp;
  late int amountSend;
  late int amountRecieved;


  var url = 'https://mocki.io/v1/4572d649-fda0-4c84-991d-08ba0961205d';

  Future<CardClass?> getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var data = response.body.toString();
      print(response.statusCode);
      return CardClass.fromJson(jsonDecode(data));

    }
    else{
      print("Error in fetching data ");
    }
  }

}