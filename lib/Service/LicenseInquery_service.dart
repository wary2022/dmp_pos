import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/CaseType_Model.dart';
import '../Model/LicenseInquery_model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class LicenseInquery_service{
  final String apiurl= Url().url + "driving_license";
  final String token= Token().getToken();


  Future<List<LicenseInquery>> getLicenseInquery_Data(String LicenseNum) async{

    var response=await http.get(Uri.parse(apiurl+'/'+ LicenseNum),
      headers: {
        'Content-Type': 'application/http',
        'Accept': 'application/http',
        'access_token': token,
      },);

    if(response.statusCode==200){
      var body=jsonDecode(response.body);

      List<LicenseInquery> licenseInquery = [];
      for (var data in body["data"]) {
        licenseInquery.add(LicenseInquery.fromJson(data));
      }

      return licenseInquery;
    }else{
      throw "Failed to load Data";
    }
  }
}