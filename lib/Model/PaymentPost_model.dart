// To parse this JSON data, do
//
//     final PaymentPost = PaymentPostFromJson(jsonString);

import 'dart:convert';

PaymentPost PaymentPostFromJson(String str) => PaymentPost.fromJson(json.decode(str));

String PaymentPostToJson(PaymentPost data) => json.encode(data.toJson());

class PaymentPost {
  PaymentPost({
    required this.penalty_amount,
    required this.case_id,

  });

  double penalty_amount;
  String case_id;


  factory PaymentPost.fromJson(Map<String, dynamic> json) => PaymentPost(
    penalty_amount: json["penalty_amount"],
    case_id: json["case_id"],

  );

  Map<String, dynamic> toJson() => {
    "penalty_amount": penalty_amount,
    "case_id": case_id,
  };
}
