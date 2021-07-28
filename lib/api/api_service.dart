import 'package:http/http.dart' as http;
import 'package:my_architect/app_setting.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  String BaseUrl = AppSetting.apirul;
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    Uri url = Uri.parse(BaseUrl + "/login");
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
