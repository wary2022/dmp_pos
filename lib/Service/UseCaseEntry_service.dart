import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/CaseType_Model.dart';
import '../Model/UseCaseEntry_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class UseCase_service{
  final String apiurl= Url().url + "case_capture_type";
  // final String apiurl=Url(url: '').url + "case_type";
  final String token= Token().getToken();


  Future<List<UseCase_Data>> getUseCase_Data() async{
      print("************************");
      print(apiurl);

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<UseCase_Data> UseCase_data = [];
        for (var data in body["data"]) {
          UseCase_data.add(UseCase_Data.fromJson(data));
        }

        return UseCase_data;
      }else{
        throw "Failed to load Data";
      }
  }
}