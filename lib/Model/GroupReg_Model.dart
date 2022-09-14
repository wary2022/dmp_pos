// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class GroupReg_Data{
  final int id;
  final String name;

  GroupReg_Data({required this.id,required this.name});

  factory GroupReg_Data.fromJson(Map<String, dynamic> json){
    return GroupReg_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


