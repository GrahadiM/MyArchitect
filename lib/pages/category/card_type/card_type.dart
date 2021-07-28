import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/component/card_list.dart';
import 'package:my_architect/model/category_all_model.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:my_architect/pages/second_project.dart';
import 'package:http/http.dart' as http;

class CategoryType extends StatelessWidget {
  String BaseUrl = AppSetting.apirul;
  List<ItemModel> list = [];
  final List<CategoryAllModel> _data;
  CategoryType(this._data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        CategoryAllModel item = _data[index];
        return GestureDetector(
          onTap: () async {
            list = [];
            print(item.id);
            Uri url = Uri.parse(BaseUrl +
                "/portofolio?category=type&categori_id=" +
                item.id.toString());
            print(BaseUrl +
                "/portofolio?category=type&categori_id=" +
                item.id.toString());
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

            Navigator.push(
              context,
              FadeRoute2(
                SecondPageProject(list),
              ),
            );
          },

          // onTap: () => Navigator.push(
          //   context,
          //   FadeRoute2(
          //     SecondPage(),
          //   ),
          // ),
          child: Card(
            elevation: 3,
            child: Row(
              children: <Widget>[
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Column(
                    children: [
                      Text(
                        item.title.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FadeRoute1 extends PageRouteBuilder {
  final Widget page;

  FadeRoute1(this.page)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: page,
          ),
        );
}

class FadeRoute2 extends PageRouteBuilder {
  final Widget page;

  FadeRoute2(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return FadeTransition(
              opacity: animation,
              child: page,
            );
          },
        );
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         brightness: Brightness.dark,
//         centerTitle: true,
//         title: Text('List Portofolio'),
//       ),
//       body: Lists(),
//     );
//   }
// }
