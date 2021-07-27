import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class APIRegister {
  Future<LoginResponseModel> register(LoginRequestModel requestModel) async {
    Uri url = Uri.parse("http://192.168.43.183/flutter/public/api/register");
    print(url);

    final response = await http.post(url, body: requestModel.toJson());
    print("response");
    print(response.body);
    print("response");
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
