import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/CaseType_Model.dart';
import '../Model/ProcecutionCode_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class ProcecutionCode_service{
  final String apiurl= Url().url + "procecution_code";
  // final String apiurl=Url(url: '').url + "case_type";
  final String token= Token().getToken();


  Future<List<ProcecutionCode_Data>> getProcecutionCode_Data() async{

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<ProcecutionCode_Data> ProcecutionCode_data = [];
        for (var data in body["data"]) {
          ProcecutionCode_data.add(ProcecutionCode_Data.fromJson(data));
        }

        return ProcecutionCode_data;
      }else{
        throw "Failed to load Data";
      }
  }
}