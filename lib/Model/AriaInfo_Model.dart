// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class AriaInfo_Data{
  final int id;
  final String name;

  AriaInfo_Data({required this.id,required this.name});

  factory AriaInfo_Data.fromJson(Map<String, dynamic> json){
    return AriaInfo_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


