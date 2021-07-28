import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_architect/api/api_project.dart';
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/component/card_list.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel> list = [];

  @override
  void initState() {
    super.initState();
    initialData();
  }

  void initialData() async {
    String BaseUrl = AppSetting.apirul;
    Uri url = Uri.parse(BaseUrl + "/portofolio");
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData["success"]);

    if (jsonData["success"]) {
      for (var u in jsonData["data"]["portofolio"]["data"]) {
        ItemModel project = ItemModel.fromJson(u);
        list.add(project);
      }
    }
    print("list.length");
    print(list.length);

    setState(() {});
  }
  // APIProject apiService = new APIProject();
  // apiService.ambilData();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'MyArchitect App\'s',
          textScaleFactor: 1.12,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Lists(list),
    );
  }
}
