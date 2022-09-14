import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/FinalCaseData_model.dart';
import 'MainService.dart';

class FinalCaseData_service{
  final String apiurl= Url().url + "cases";
  final String token= Token().getToken();



  Future<List<FinalCaseData>> getFinalCaseData() async{

      var Uid = SaveData().getId();

      var response=await http.get(Uri.parse(apiurl+'/'+Uid.toString()),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },
      );

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<FinalCaseData> FinalCase_Data = [];
        for (var data in body["data"]) {
          FinalCase_Data.add(FinalCaseData.fromJson(data));
        }

        return FinalCase_Data;
      }else{
        throw "Failed to load Data";
      }

  }
}