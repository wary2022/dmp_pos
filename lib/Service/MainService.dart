import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/login_model.dart';


class Url{
  // String url ="http://10.10.9.30:8075/";
  String url ="http://182.160.110.154:8021/";

}

class Token{
  static String token = '';
  setToken(String accessToken){
    token = accessToken;
  }
  getToken(){
    return token;
  }
}

class SaveData{
  static int uid = 0;
  setId(int userId){
    uid = userId;
  }
  getId(){
    return uid;
  }
}


class DB{
  // String db = "dmp_pos";
  String db = "ERPPILOT";
}


