import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
class user_details{
  late int user_id;
  late String position;
  late int employee_id;
  late String employee_pin;
  late String name;
  late String email;
  late String dob;
  late String profilr_image;
  user_details({required this.user_id,required this.position,required this.employee_id,required this.employee_pin,
                required this.name,required this.email,required this.dob,required this.profilr_image});

  factory user_details.fromJson(Map<String, dynamic> json) {
    return user_details(
        user_id: json['user_id'],
        position: json['position'],
        employee_id: json['employee_id'],
        employee_pin: json['employee_pin'],
        name: json['name'],
        email: json['email'],
        dob: json['dob'],
        profilr_image: json['profile_image']);
  }
}
class user_login{
  late bool status;
  late String message;
  late user_details user;
  late String access_token;


  user_login({required this.status,required this.message,required this.user,required this.access_token});


  factory user_login.fromJson(Map<String, dynamic> json) {
    // List<user_details> ud;

    return user_login(
      status:json['status'],
      message: json['message'],
      // user: json['user'],
      user: user_details.fromJson(json['user']),
      access_token: json['access_token']

      // id: json['users']['id'],
      // username: json['users']['username'],
      // Password: json['users']['Password'],
    );
  }

  Future<Object> fetchUser(uname,pass) async{
    final userName=uname.text;
    final passward=pass.text;
    // final api="0.0.0.0:8072/login?db='16_2_2022'&login=$userName&password=$passw&fcm_token='asdasdaad'";
    final response=await http.get(Uri.parse("http://10.10.9.30:8072/login?db=16_2_2022&login=${userName}&password=$passward&fcm_token=asdasdaad"));
    // final response=await http.get(Uri.parse("http://0.0.0.0:8072/login?db=16_2_2022&login=${userName}&password=$passward&fcm_token=asdasdaad"), headers: {
    //   "Accept": "application/json",
    //   "Access-Control-Allow-Origin": "*"
    // });
    // final response=await rootBundle.loadString('lib/JSON_FILES/login.json');
    if (response.statusCode==200){
      // final test=await user_login.fromJson(jsonDecode(response.body));
      return true;
    }


    else{
      return false;
    }

    // return user_login.fromJson(jsonDecode(response.body));

  }
}


