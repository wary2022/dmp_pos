import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/CaseType_Model.dart';
import '../Model/Documents_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class Documents_service{
  final String apiurl= Url().url + "vehicle_seized_document";
  final String token= Token().getToken();


  Future<List<Documents_Data>> getDocuments_Data() async{

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<Documents_Data> Documents_data = [];
        for (var data in body["data"]) {
          Documents_data.add(Documents_Data.fromJson(data));
        }

        return Documents_data;
      }else{
        throw "Failed to load Data";
      }
  }
}