// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class Documents_Data{
  final int id;
  final String name;

  Documents_Data({required this.id,required this.name});

  factory Documents_Data.fromJson(Map<String, dynamic> json){
    return Documents_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


