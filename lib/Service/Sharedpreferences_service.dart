// import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences_service{
  void keep_case_data_string(keyname, data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = keyname;
    final value = data;
    prefs.setString(key, value);
  }

  void keep_case_data_commonError(keyname, data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = keyname;
    final value = data;
    prefs.setString(key, value);
  }

  void keep_case_data_int(keyname, data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = keyname;
    final value = data;
    prefs.setInt(key, value);
  }
  void keep_case_data_array(keyname, data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = keyname;
    String s = "";
    for (int i = 0; i < data.length; i++) {
      if (i==data.length-1){
        s += data[i];
      }
      else {
        s += data[i] + ',';
      }
    }
    prefs.setString(key, s);
  }
  void keep_case_data_file(keyname, data) async {
    final prefs = await SharedPreferences.getInstance();
    final key = keyname;
    final value = data;
    prefs.setString(key, value);
  }
}
