import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/model/category_all_model.dart';
import 'package:my_architect/pages/category/card_type/card_type.dart';
import 'package:my_architect/pages/category/card_model/card_model.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String BaseUrl = AppSetting.apirul;
  List<CategoryAllModel> list_categori_model = [];
  List<CategoryAllModel> list_categori_type = [];
  @override
  void initialDataModel() async {
    Uri url = Uri.parse(BaseUrl + "/kategori?q=model");
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData["success"]);

    if (jsonData["success"]) {
      for (var u in jsonData["data"]["category"]) {
        CategoryAllModel project = CategoryAllModel.fromJson(u);
        list_categori_model.add(project);
      }
    }
    print("list_categori_model.length");
    print(list_categori_model.length);

    setState(() {});
  }

  void initialDataType() async {
    Uri url = Uri.parse(BaseUrl + "/kategori?q=type");
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData["success"]);

    if (jsonData["success"]) {
      for (var u in jsonData["data"]["category"]) {
        CategoryAllModel project = CategoryAllModel.fromJson(u);
        list_categori_type.add(project);
      }
    }
    print("list_categori_type.length");
    print(list_categori_type.length);

    setState(() {});
  }

  void initState() {
    super.initState();
    initialDataModel();
    initialDataType();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 20,
          shadowColor: Color(0xffF0F0F0).withOpacity(.4),
          backgroundColor: Colors.blue,
          title: Text(
            'MyArchitect App\'s',
            textScaleFactor: 1.12,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.black.withOpacity(.8),
            unselectedLabelStyle:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(.5)),
            unselectedLabelColor: Colors.black.withOpacity(.4),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black.withOpacity(.8),
            tabs: [
              Tab(
                child: Text(
                  'Category Type',
                ),
              ),
              Tab(
                child: Text(
                  'Category Model',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryType(list_categori_type),
            CategoryModel(list_categori_model),
          ],
        ),
      ),
    );
  }
}
