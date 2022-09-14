
import 'dart:convert';


class SingleCaseData {
  final int id;
  final String name;
  final String casType;
  final String caseCaptureType;
  final String area;
  final String vehicleRegistrationGroup;
  final String vehicleNumber;
  final String accusedPersonName;
  final String accusedPersonFatherName;
  final String accusedPersonMobileNo;
  final String accusedPersonAddress;
  final String witnessBipId;
  final String licenseNumber;
  final String vehicleEngineNumber;
  final String vehicleChassisNumber;
  final String comment;
  final String caseProcecution;
  final String seizedDocument;
  final String status;
  final String file;
  final double penaltyAmount;

  SingleCaseData({
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
    required this.file,
    required this.status,
    required this.penaltyAmount,
  });

  factory SingleCaseData.fromJson(Map<String, dynamic> json){
    return SingleCaseData(
      id: json["id"] as int,
      name: json["name"] as String,
      casType: json["cas_type"] as String,
      caseCaptureType: json["case_capture_type"] as String,
      area: json["area"] as String,
      vehicleRegistrationGroup: json["vehicle_registration_group"] as String,
      vehicleNumber: json["vehicle_number"] as String,
      accusedPersonName: json["accused_person_name"] as String,
      accusedPersonFatherName: json["accused_person_father_name"] as String,
      accusedPersonMobileNo: json["accused_person_mobile_no"] as String,
      accusedPersonAddress: json["accused_person_address"] as String,
      witnessBipId: json["witness_bip_id"] as String,
      licenseNumber: json["license_number"] as String,
      vehicleEngineNumber: json["vehicle_engine_number"] as String,
      vehicleChassisNumber: json["vehicle_chassis_number"] as String,
      comment: json["comment"] as String,
      caseProcecution: json["case_procecution"] as String,
      seizedDocument: json["seized_document"] as String,
      file: json["file_url"] == false ? '' : json["file_url"] as String,
      status: json["status"] as String,
      penaltyAmount: json["penalty_amount"] as double,
    );
  }

}
