//
// import 'dart:convert';
//
//
// class FinalCaseData {
//   final int id;
//   final String name;
//   final String casType;
//   final String caseCaptureType;
//   final String area;
//   final String vehicleRegistrationGroup;
//   final String vehicleNumber;
//   final String accusedPersonName;
//   final String accusedPersonFatherName;
//   final String accusedPersonMobileNo;
//   final String accusedPersonAddress;
//   final String witnessBipId;
//   final String licenseNumber;
//   final String vehicleEngineNumber;
//   final String vehicleChassisNumber;
//   final String comment;
//   final String caseProcecution;
//   final String seizedDocument;
//   final String status;
//   final String file;
//   final double penaltyAmount;
//
//   FinalCaseData({
//     required this.id,
//     required this.name,
//     required this.casType,
//     required this.caseCaptureType,
//     required this.area,
//     required this.vehicleRegistrationGroup,
//     required this.vehicleNumber,
//     required this.accusedPersonName,
//     required this.accusedPersonFatherName,
//     required this.accusedPersonMobileNo,
//     required this.accusedPersonAddress,
//     required this.witnessBipId,
//     required this.licenseNumber,
//     required this.vehicleEngineNumber,
//     required this.vehicleChassisNumber,
//     required this.comment,
//     required this.caseProcecution,
//     required this.seizedDocument,
//     required this.file,
//     required this.status,
//     required this.penaltyAmount,
//   });
//
//   factory FinalCaseData.fromJson(Map<String, dynamic> json){
//     return FinalCaseData(
//       id: json["id"] as int,
//       name: json["name"] as String,
//       casType: json["cas_type"] as String,
//       caseCaptureType: json["case_capture_type"] as String,
//       area: json["area"] as String,
//       vehicleRegistrationGroup: json["vehicle_registration_group"] as String,
//       vehicleNumber: json["vehicle_number"] as String,
//       accusedPersonName: json["accused_person_name"] as String,
//       accusedPersonFatherName: json["accused_person_father_name"] as String,
//       accusedPersonMobileNo: json["accused_person_mobile_no"] as String,
//       accusedPersonAddress: json["accused_person_address"] as String,
//       witnessBipId: json["witness_bip_id"] as String,
//       licenseNumber: json["license_number"] as String,
//       vehicleEngineNumber: json["vehicle_engine_number"] as String,
//       vehicleChassisNumber: json["vehicle_chassis_number"] as String,
//       comment: json["comment"] as String,
//       caseProcecution: json["case_procecution"] as String,
//       seizedDocument: json["seized_document"] as String,
//       file: json["file_url"] as String,
//       status: json["status"] as String,
//       penaltyAmount: json["penalty_amount"] as double,
//     );
//   }
//
// }
import 'dart:convert';

FinalCaseData FinalCaseDataFromJson(String str) => FinalCaseData.fromJson(json.decode(str));

String FinalCaseDataToJson(FinalCaseData data) => json.encode(data.toJson());

class FinalCaseData {
  FinalCaseData({
    required this.id,
    required this.name,
    required this.casType,
    required this.caseCaptureType,
    required this.area,
    required this.vehicleRegistrationGroup,
    required this.vehicleNumber,
    required this.accusedPersonName,
    required this.accusedPersonFatherName,
    required this.accusedPersonMobileNo,
    required this.accusedPersonAddress,
    required this.witnessBipId,
    required this.licenseNumber,
    required this.vehicleEngineNumber,
    required this.vehicleChassisNumber,
    required this.comment,
    required this.caseProcecution,
    required this.seizedDocument,
    required this.fileUrl,
    required this.penaltyAmount,
    required this.status,
    required this.caseDate,
  });

  int id;
  String name;
  String casType;
  String caseCaptureType;
  String area;
  String vehicleRegistrationGroup;
  String vehicleNumber;
  String accusedPersonName;
  String accusedPersonFatherName;
  String accusedPersonMobileNo;
  String accusedPersonAddress;
  String witnessBipId;
  String licenseNumber;
  String vehicleEngineNumber;
  String vehicleChassisNumber;
  String comment;
  String caseProcecution;
  String seizedDocument;
  String fileUrl;
  double penaltyAmount;
  String status;
  String caseDate;

  factory FinalCaseData.fromJson(Map<String, dynamic> json) => FinalCaseData(
    id: json["id"],
    name: json["name"],
    casType: json["cas_type"],
    caseCaptureType: json["case_capture_type"],
    area: json["area"],
    vehicleRegistrationGroup: json["vehicle_registration_group"],
    vehicleNumber: json["vehicle_number"],
    accusedPersonName: json["accused_person_name"],
    accusedPersonFatherName: json["accused_person_father_name"],
    accusedPersonMobileNo: json["accused_person_mobile_no"],
    accusedPersonAddress: json["accused_person_address"],
    witnessBipId: json["witness_bip_id"],
    licenseNumber: json["license_number"],
    vehicleEngineNumber: json["vehicle_engine_number"],
    vehicleChassisNumber: json["vehicle_chassis_number"],
    comment: json["comment"],
    caseProcecution: json["case_procecution"],
    seizedDocument: json["seized_document"],
    fileUrl: json["file_url"] == false ? '' : json["file_url"],
    penaltyAmount: json["penalty_amount"],
    status: json["status"],
    caseDate: json["create_date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cas_type": casType,
    "case_capture_type": caseCaptureType,
    "area": area,
    "vehicle_registration_group": vehicleRegistrationGroup,
    "vehicle_number": vehicleNumber,
    "accused_person_name": accusedPersonName,
    "accused_person_father_name": accusedPersonFatherName,
    "accused_person_mobile_no": accusedPersonMobileNo,
    "accused_person_address": accusedPersonAddress,
    "witness_bip_id": witnessBipId,
    "license_number": licenseNumber,
    "vehicle_engine_number": vehicleEngineNumber,
    "vehicle_chassis_number": vehicleChassisNumber,
    "comment": comment,
    "case_procecution": caseProcecution,
    "seized_document": seizedDocument,
    "file_url": fileUrl,
    "penalty_amount": penaltyAmount,
    "status": status,
    "create_date": caseDate,
  };
}