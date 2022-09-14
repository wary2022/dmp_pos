// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class ProcecutionCode_Data{
  final int id;
  final String name;

  ProcecutionCode_Data({required this.id,required this.name});

  factory ProcecutionCode_Data.fromJson(Map<String, dynamic> json){
    return ProcecutionCode_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


