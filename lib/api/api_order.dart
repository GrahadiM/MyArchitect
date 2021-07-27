import 'package:http/http.dart' as http;
import 'package:my_architect/model/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIOrder {
  Future<OrderResponseModel> order(OrderRequestModel requestModel) async {
    Uri url = Uri.parse("http://192.168.43.183/flutter/public/api/order");

    final response = await http.post(url, body: requestModel.toJson());

    print("response");
    print(response.body);
    print("response");
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      return OrderResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
