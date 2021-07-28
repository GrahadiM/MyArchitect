import 'package:http/http.dart' as http;
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/model/edit_profil_model.dart';
import 'package:my_architect/model/order_model.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIEditProfil {
  String BaseUrl = AppSetting.apirul;
  Future<EditProfilResponseModel> edit(
      EditProfilRequestModel requestModel) async {
    Uri url = Uri.parse(BaseUrl + "/akun/edit");
    print(url);

    final response = await http.post(url, body: requestModel.toJson());
    print("response");
    print(response.body);
    print("response");
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      return EditProfilResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
