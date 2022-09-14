// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class CaseType_Data{
  final int id;
  final String name;

  CaseType_Data({required this.id,required this.name});

  factory CaseType_Data.fromJson(Map<String, dynamic> json){
    return CaseType_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


