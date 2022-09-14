import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/AriaInfo_Model.dart';
import '../Model/GroupReg_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class VehicleInfo_service{
  final String apiurl= Url().url + "case_area";
  final String apiurl2= Url().url + "vehicle_registration_group";
  final String token= Token().getToken();


  Future<List<AriaInfo_Data>> getAriaInfo_Data() async{

      var response=await http.get(Uri.parse(apiurl),
        headers: {
          'Content-Type': 'application/http',
          'Accept': 'application/http',
          'access_token': token,
      },);

      if(response.statusCode==200){
        var body=jsonDecode(response.body);

        List<AriaInfo_Data> AriaInfo_data = [];
        for (var data in body["data"]) {
          AriaInfo_data.add(AriaInfo_Data.fromJson(data));
        }

        return AriaInfo_data;
      }else{
        throw "Failed to load Data";
      }
  }

  Future<List<GroupReg_Data>> getGroupReg_Data() async{

    var response=await http.get(Uri.parse(apiurl2),
      headers: {
        'Content-Type': 'application/http',
        'Accept': 'application/http',
        'access_token': token,
      },);

    if(response.statusCode==200){
      var body=jsonDecode(response.body);

      List<GroupReg_Data> GroupReg_data = [];
      for (var data in body["data"]) {
        GroupReg_data.add(GroupReg_Data.fromJson(data));
      }

      return GroupReg_data;
    }else{
      throw "Failed to load Data";
    }
  }
}