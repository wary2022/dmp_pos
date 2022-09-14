import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:http/http.dart';

LicenseInquery licenseInqueryFromJson(String str) => LicenseInquery.fromJson(json.decode(str));

String licenseInqueryToJson(LicenseInquery data) => json.encode(data.toJson());

class LicenseInquery {
  LicenseInquery({
    required this.id,
    required this.licenseNumber,
    required this.ownerName,
    required this.ownerDob,
    required this.ownerFatherName,
    required this.licenseIssueDate,
    required this.licenseValidityDate,
    required this.ownerNid,
    required this.ownerImage,
  });

  int id;
  String licenseNumber;
  String ownerName;
  String ownerDob;
  String ownerFatherName;
  String licenseIssueDate;
  String licenseValidityDate;
  String ownerNid;
  String ownerImage;

  factory LicenseInquery.fromJson(Map<String, dynamic> json) => LicenseInquery(
    id: json["id"],
    licenseNumber: json["license_number"],
    ownerName: json["owner_name"],
    ownerDob: json["owner_dob"],
    ownerFatherName: json["owner_father_name"],
    licenseIssueDate: json["license_issue_date"],
    licenseValidityDate: json["license_validity_date"],
    ownerNid: json["owner_nid"],
    ownerImage: json["owner_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "license_number": licenseNumber,
    "owner_name": ownerName,
    "owner_dob": ownerDob,
    "owner_father_name": ownerFatherName,
    "license_issue_date": licenseIssueDate,
    "license_validity_date": licenseValidityDate,
    "owner_nid": ownerNid,
    "owner_image": ownerImage,
  };
}
