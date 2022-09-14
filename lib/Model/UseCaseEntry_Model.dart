// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class UseCase_Data{
  final int id;
  final String name;

  UseCase_Data({required this.id,required this.name});

  factory UseCase_Data.fromJson(Map<String, dynamic> json){
    return UseCase_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


