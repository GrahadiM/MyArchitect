import 'package:http/http.dart' as http;
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/model/order_model.dart';
import 'package:my_architect/model/review_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIReviewPost {
  String BaseUrl = AppSetting.apirul;
  Future<OrderResponseModel> order(ReviewRequestModel requestModel) async {
    Uri url = Uri.parse(BaseUrl + "/review");
    print(url);
    final body = requestModel.toJson();
    final response = await http.post(url, body: body);

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
