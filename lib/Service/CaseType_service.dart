import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/CaseType_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class CaseType_service{
  final String apiurl= Url().url + "case_type";
  final String token= Token().getToken();


  Future<List<CaseType_Data>> getCaseType_Data() async{
      print("************************");
      print(apiurl);
      print(token);

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<CaseType_Data> caseType_data = [];
        for (var data in body["data"]) {
          caseType_data.add(CaseType_Data.fromJson(data));
        }

        return caseType_data;
      }else{
        throw "Failed to load Data";
      }
  }
}