// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class LogIn_Data{
  final int id;
  final String password;

  LogIn_Data({required this.id,required this.password});

  factory LogIn_Data.fromJson(Map<String, dynamic> json){
    return LogIn_Data(
      id:json['id'] as int,
      password:json['password'] as String
    );
  }
}


