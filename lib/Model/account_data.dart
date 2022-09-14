import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
class account_details {
  late int user_id;
  late String position;
  late int employee_id;
  late String employee_pin;
  late String name;
  late String email;
  late String dob;
  late String profilr_image;

  account_details(
      {required this.user_id, required this.position, required this.employee_id, required this.employee_pin,
        required this.name, required this.email, required this.dob, required this.profilr_image});
}