import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/SingleCaseData_model.dart';
import 'MainService.dart';

class SingleCaseData_service{
  final String apiurl= Url().url + "single_case";
  final String token= Token().getToken();



  Future<List<SingleCaseData>> getSingleCaseData(String CaseID) async{

      var Uid = SaveData().getId();

      var response=await http.get(Uri.parse(apiurl+'/'+Uid.toString()+'/'+ CaseID),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },
      );

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<SingleCaseData> SingleCase_Data = [];
        for (var data in body["data"]) {
          SingleCase_Data.add(SingleCaseData.fromJson(data));
        }

        return SingleCase_Data;
      }else{
        throw "Failed to load Data";
      }
  }
}