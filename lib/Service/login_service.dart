import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/login_model.dart';
import 'MainService.dart';


class LogIn_service{
  // final String apiurl=Url(url: '').url + "api/auth/token";
  final String apiurl = Url().url + "api/auth/token";
  final String token= Token().getToken();


  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  };

  Future<List<LogIn_Data>> getLogIn_Data() async{
      print("************************");

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<LogIn_Data> logIn_data = [];
        for (var data in body["data"]) {
          logIn_data.add(LogIn_Data.fromJson(data));
        }

        // List<Case_types> ct=body["data"].map((dynamic item) =>Case_types.fromJson(item)).toList();
        // print(ct);

        return logIn_data;
      }else{
        throw "Failed to load Login Access";
      }
  }
}