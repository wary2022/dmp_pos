import 'dart:convert';

import 'package:flutter/services.dart';

class so_details{
  late String so_name;
  late String cases;
  late String date;
  late String person;
  late String code;
  late String document;
  late String amount;
  late String picture;

  so_details({
    required this.so_name,
    required this.cases,
    required this.date,
    required this.person,
    required this.code,
    required this.document,
    required this.amount,
    required this.picture
});

  so_details.fromJson(Map<String,dynamic> json){
    so_name=json['so_name'];
    cases=json['cases'];
    date=json['date'];
    person=json['person'];
    code=json['code'];
    document=json['document'];
    amount=json['amount'];
    picture=json['picture'];

  }

  Future<List<so_details>> fetchSO() async {
    final response = await rootBundle.loadString(
        'lib/JSON_FILES/SO_details.json');
    final list = json.decode(response) as List<dynamic>;
    return list.map((e) => so_details.fromJson(e)).toList();
  }

  // List<so_details> fetchSOTest() async {
  //   final response = await rootBundle.loadString(
  //       'lib/JSON_FILES/SO_details.json');
  //   final list = json.decode(response) as List<dynamic>;
  //   return list.map((e) => so_details.fromJson(e)).toList();
  // }
  }