// To parse this JSON data, do
//
//     final formData = formDataFromJson(jsonString);

import 'dart:convert';

FormData formDataFromJson(String str) => FormData.fromJson(json.decode(str));

String formDataToJson(FormData data) => json.encode(data.toJson());

class FormData {
  FormData({
    required this.caseTypeId,
    required this.caseCaptureId,
    required this.areaId,
    required this.vehicleRegistrationId,
    required this.vehicleNumber,
    required this.procecutionId,
    required this.seizedDocId,
    required this.accusedPersonName,
    required this.accussedPersonFatherName,
    required this.accussedPersonMobileNo,
    required this.accussedPersonAddress,
    required this.comment,
    required this.witnessBipId,
    required this.licenseNumber,
    required this.vehicleEngineNumber,
    required this.vehicleChassisNumber,
    required this.uploadFile,
  });

  int caseTypeId;
  int caseCaptureId;
  int areaId;
  int vehicleRegistrationId;
  int vehicleNumber;
  List<int> procecutionId;
  List<int> seizedDocId;
  String accusedPersonName;
  String accussedPersonFatherName;
  int accussedPersonMobileNo;
  String accussedPersonAddress;
  int comment;
  String witnessBipId;
  String licenseNumber;
  String vehicleEngineNumber;
  String vehicleChassisNumber;
  String uploadFile;

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
    caseTypeId: json["case_type_id"],
    caseCaptureId: json["case_capture_id"],
    areaId: json["area_id"],
    vehicleRegistrationId: json["vehicle_registration_id"],
    vehicleNumber: json["vehicle_number"],
    procecutionId: List<int>.from(json["procecution_id"].map((x) => x)),
    seizedDocId: List<int>.from(json["seized_doc_id"].map((x) => x)),
    accusedPersonName: json["accused_person_name"],
    accussedPersonFatherName: json["accussed_person_father_name"],
    accussedPersonMobileNo: json["accussed_person_mobile_no"],
    accussedPersonAddress: json["accussed_person_address"],
    comment: json["comment"],
    witnessBipId: json["witness_bip_id"],
    licenseNumber: json["license_number"],
    vehicleEngineNumber: json["vehicle_engine_number"],
    vehicleChassisNumber: json["vehicle_chassis_number"],
    uploadFile: json["upload_file"],
  );

  Map<String, dynamic> toJson() => {
    "case_type_id": caseTypeId,
    "case_capture_id": caseCaptureId,
    "area_id": areaId,
    "vehicle_registration_id": vehicleRegistrationId,
    "vehicle_number": vehicleNumber,
    "procecution_id": List<dynamic>.from(procecutionId.map((x) => x)),
    "seized_doc_id": List<dynamic>.from(seizedDocId.map((x) => x)),
    "accused_person_name": accusedPersonName,
    "accussed_person_father_name": accussedPersonFatherName,
    "accussed_person_mobile_no": accussedPersonMobileNo,
    "accussed_person_address": accussedPersonAddress,
    "comment": comment,
    "witness_bip_id": witnessBipId,
    "license_number": licenseNumber,
    "vehicle_engine_number": vehicleEngineNumber,
    "vehicle_chassis_number": vehicleChassisNumber,
    "upload_file": uploadFile,
  };
}
