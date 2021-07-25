import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_architect/pages/category/card_type.dart';
import 'package:my_architect/pages/category/card_model.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffF8F9FB),
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 20,
          shadowColor: Color(0xffF0F0F0).withOpacity(.4),
          backgroundColor: Colors.blue,
          title: Text(
            '   MyArchitect App\'s',
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
            CategoryType(),
            CategoryModel(),
          ],
        ),
      ),
    );
  }
}
