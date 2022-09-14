import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/FormData_model.dart';
import 'MainService.dart';


class FormData_service{


    final String apiurl= Url().url;
    final String token= Token().getToken();

    // Future<http.Response> postData(String title) {
    //   return http.post(
    //     Uri.parse(apiurl),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, String>{
    //       'title': title,
    //     }),
    //   );
    // }

    Future<FormData> postData(data, apiUrl) async {
      var fullUrl = apiurl+apiUrl;
      final response = await http.post(
            Uri.parse(fullUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'access_token': token,
        },
            body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return FormData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to Post Data.');
      }
    }

    // postData(data, apiUrl) async {
    //   var fullUrl = apiurl+apiUrl;
    //   return await http.post(
    //     Uri.parse(fullUrl),
    //     body: jsonEncode(data),
    //     headers: _setHeaders(),
    //   );
    // }
    //
    // _setHeaders()=>{
    //   'Content-Type': 'application/http',
    //   'Accept': 'application/http',
    //   'access_token': token,
    // };


  }