
// import 'dart:ffi';

// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// part 'case_type.g.dart';

class Miscellaneous_Data{
  final int id;
  final String name;

  Miscellaneous_Data({required this.id,required this.name});

  factory Miscellaneous_Data.fromJson(Map<String, dynamic> json){
    return Miscellaneous_Data(
        id:json['id'] as int,
        name:json['name'] as String
    );
  }
}




// class Miscellaneous_Data{
//   final int id;
//   final String name;
//
//   Miscellaneous_Data({required this.id,required this.name});
//
//   factory Miscellaneous_Data.fromJson(Map<String, dynamic> json){
//     var tt=json.values.toList();
//     var tt1=tt[1][0]['id'];
//     return Miscellaneous_Data(
//       id:json['id'] as int,
//       name:json['name'] as String
//     );
//   }
// }


