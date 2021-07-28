import 'package:flutter/material.dart';
import 'package:my_architect/component/card_list.dart';
import 'package:my_architect/model/item_model.dart';

class SecondPageProject extends StatelessWidget {
  List<ItemModel> list = [];
  SecondPageProject(this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('List Project'),
      ),
      body: Lists(list),
    );
  }
}
