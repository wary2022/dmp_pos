// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class MiscellaneousReason_Data{
  final int id;
  final String name;

  MiscellaneousReason_Data({required this.id,required this.name});

  factory MiscellaneousReason_Data.fromJson(Map<String, dynamic> json){
    return MiscellaneousReason_Data(
      id:json['id'] as int,
      name:json['name'] as String
    );
  }
}


