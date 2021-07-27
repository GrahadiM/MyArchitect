import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:my_architect/pages/history/card.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int userId;

  Future<void> _getUserId() async {
    final SharedPreferences prefs = await _prefs;
    userId = prefs.getInt('userId');
    print(userId);

    Uri url = Uri.parse(
        "http://192.168.43.183/flutter/public/api/history?id=".toString() +
            userId.toString());
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("http://192.168.43.183/flutter/public/api/history?id=".toString() +
        userId.toString());
    print("jsonData");
    print(jsonData);

    if (jsonData["success"]) {
      for (var u in jsonData["data"]["order"]) {
        ItemModel project = ItemModel.fromJson(u);
        list.add(project);
      }
    }
    print("list.length");
    print(list.length);
    setState(() {});
  }

  List<ItemModel> list = [];
  @override
  void initState() {
    super.initState();
    _getUserId();

    // initialData();
  }

  // void initialData() async {
  //   // _getUserId();

  //   setState(() {});
  // }

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
