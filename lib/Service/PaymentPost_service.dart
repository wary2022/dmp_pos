import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/PaymentPost_model.dart';
import 'MainService.dart';


class PaymentPost_service{


    final String apiurl= Url().url;
    final String token= Token().getToken();



    Future<PaymentPost> postData(data) async {
      var fullUrl = apiurl+'payment';
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
        return PaymentPost.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to Post Data.');
      }
    }


  }