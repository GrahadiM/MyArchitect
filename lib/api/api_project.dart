import 'package:http/http.dart' as http;
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/model/item_model.dart';
import 'dart:convert';
import '../model/item_model.dart';

class APIProject {
  String BaseUrl = AppSetting.apirul;
  Future<List<ItemModel>> ambilData() async {
    Uri url = Uri.parse(BaseUrl + "/login");
    print(url);
    List<ItemModel> projects = [];

    final response = await http.post(url);
    var jsonData = json.decode(response.body);

    if (jsonData.success) {
      for (var u in jsonData) {
        ItemModel project = ItemModel.fromJson(u);
        projects.add(project);
      }
    }

    print(projects.length);
    return projects;
    // final response = await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    // print("response");
    // print(response.body);
    // print("response");
    // if (response.statusCode == 200 ||
    //     response.statusCode == 400 ||
    //     response.statusCode == 500) {
    //   return ItemModel.fromJson(
    //     json.decode(response.body),
    //   );
    // } else {
    //   throw Exception('Failed to load data!');
    // }
  }
}
