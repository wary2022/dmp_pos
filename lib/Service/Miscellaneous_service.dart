import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/MiscellaneousReason_model.dart';
import '../Model/Miscellaneous_Model.dart';
import '../Model/GroupReg_Model.dart';
import '../Model/login_model.dart';
import 'MainService.dart';

class Miscellaneous_service {
  final String apiurl = Url().url + "miscellaneous_types";
  final String apiurl2 = Url().url + "comments";
  final String token = Token().getToken();

  String caseType = "";
  String caseUse = "";
  String caseAria = "";
  String regGroup = "";
  String vehicleNumber = "";
  String procecutionCode = "";
  String Documents = "";
  String persionName = "";
  String fatherName = "";
  String MobNumber = "";
  String persionAddress = "";
  String miscellaneousType = "";
  String Reason = "";
  String witnessId = "";

  Future<List<Miscellaneous_Data>> getMiscellaneous_Data() async {
    var response = await http.get(
      Uri.parse(apiurl),
      headers: {
        'Content-Type': 'application/http',
        'Accept': 'application/http',
        'access_token': token,
      },
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      List<Miscellaneous_Data> Miscellaneous_data = [];
      for (var data in body["data"]) {
        Miscellaneous_data.add(Miscellaneous_Data.fromJson(data));
      }

      return Miscellaneous_data;
    } else {
      throw "Failed to load Data";
    }
  }

  Future<List<MiscellaneousReason_Data>> getMiscellaneousReason_Data() async {
    var response = await http.get(
      Uri.parse(apiurl2),
      headers: {
        'Content-Type': 'application/http',
        'Accept': 'application/http',
        'access_token': token,
      },
    );

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      List<MiscellaneousReason_Data> MiscellaneousReason_data = [];
      for (var data in body["data"]) {
        MiscellaneousReason_data.add(MiscellaneousReason_Data.fromJson(data));
      }

      return MiscellaneousReason_data;
    } else {
      throw "Failed to load Data";
    }
  }

  Future<http.StreamedResponse> uploadImage(filename, url) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "access_token": token
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    final prefs = await SharedPreferences.getInstance();
    this.caseType = prefs.getInt('CaseType').toString();
    this.caseUse = prefs.getInt('UseCaseType').toString();
    this.caseAria = prefs.getString('CaseAria').toString();
    this.regGroup = prefs.getString('Reg_group').toString();
    this.vehicleNumber = prefs.getString('vehicle_number').toString();
    this.procecutionCode = prefs.getString('ProcecutionCode').toString();
    this.Documents = prefs.getString('SeizedDocs').toString();
    this.persionName = prefs.getString('persionName').toString();
    this.fatherName = prefs.getString('father_name').toString();
    this.MobNumber = prefs.getString('mobile_number').toString();
    this.persionAddress = prefs.getString('person_address').toString();
    this.miscellaneousType = prefs.getString('miscellaneousType').toString();
    this.Reason = prefs.getString('selectReason').toString();
    this.witnessId = prefs.getString('witnessId').toString();

    request.fields['case_type_id'] = this.caseType;
    request.fields['case_capture_id'] = this.caseUse.toString();
    request.fields['area_id'] = this.caseAria.toString();
    request.fields['vehicle_registration_id'] = this.regGroup.toString();
    request.fields['vehicle_number'] = this.vehicleNumber.toString();
    request.fields['procecution_id'] = this.procecutionCode.toString();
    request.fields['seized_doc_id'] = this.Documents.toString();
    request.fields['accused_person_name'] = this.persionName.toString();
    request.fields['accussed_person_father_name'] = this.fatherName.toString();
    request.fields['accussed_person_mobile_no'] = this.MobNumber.toString();
    request.fields['accussed_person_address'] = this.persionAddress.toString();
    request.fields['comment'] = this.Reason.toString();
    request.fields['witness_bip_id'] = this.witnessId.toString();

    // if(filename != 'null'){
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    var _result = await http.Response.fromStream(res);
    if (res.statusCode == 200) {
      return res;
    }

    return res;
  }
  Future<http.StreamedResponse> uploadData(url) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "access_token": token
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    final prefs = await SharedPreferences.getInstance();
    this.caseType = prefs.getInt('CaseType').toString();
    this.caseUse = prefs.getInt('UseCaseType').toString();
    this.caseAria = prefs.getString('CaseAria').toString();
    this.regGroup = prefs.getString('Reg_group').toString();
    this.vehicleNumber = prefs.getString('vehicle_number').toString();
    this.procecutionCode = prefs.getString('ProcecutionCode').toString();
    this.Documents = prefs.getString('SeizedDocs').toString();
    this.persionName = prefs.getString('persionName').toString();
    this.fatherName = prefs.getString('father_name').toString();
    this.MobNumber = prefs.getString('mobile_number').toString();
    this.persionAddress = prefs.getString('person_address').toString();
    this.miscellaneousType = prefs.getString('miscellaneousType').toString();
    this.Reason = prefs.getString('selectReason').toString();
    this.witnessId = prefs.getString('witnessId').toString();

    request.fields['case_type_id'] = this.caseType;
    request.fields['case_capture_id'] = this.caseUse.toString();
    request.fields['area_id'] = this.caseAria.toString();
    request.fields['vehicle_registration_id'] = this.regGroup.toString();
    request.fields['vehicle_number'] = this.vehicleNumber.toString();
    request.fields['procecution_id'] = this.procecutionCode.toString();
    request.fields['seized_doc_id'] = this.Documents.toString();
    request.fields['accused_person_name'] = this.persionName.toString();
    request.fields['accussed_person_father_name'] = this.fatherName.toString();
    request.fields['accussed_person_mobile_no'] = this.MobNumber.toString();
    request.fields['accussed_person_address'] = this.persionAddress.toString();
    request.fields['comment'] = this.Reason.toString();
    request.fields['witness_bip_id'] = this.witnessId.toString();

    var res = await request.send();
    var _result = await http.Response.fromStream(res);
    if (res.statusCode == 200) {
      return res;
    }

    return res;
  }
}
