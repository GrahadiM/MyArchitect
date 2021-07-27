import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/component/card_detail.dart';
import 'package:my_architect/model/item_model.dart';

class Item {
  final String id;
  final String title;
  final String categoryType;
  final String categoryModel;
  final String author;
  final String image;

  Item(
    this.id,
    this.title,
    this.categoryType,
    this.categoryModel,
    this.author,
    this.image,
  );
}

class Lists extends StatelessWidget {
  List<ItemModel> _data = [];
  List<ItemModel> item_model = [];
  Lists(this._data);

  @override
  void initState() {
    initialData();
  }

  void initialData() async {
    print("item_model.length");
    for (var item in item_model) {
      Item calon_item = Item(item.id, item.title, item.categoryType,
          item.categoryModel, item.author, item.image);
    }
    print(item_model.length);
    //
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        ItemModel item = _data[index];
        return Card(
          elevation: 3,
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 110,
                padding:
                    EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.categoryType.toUpperCase(),
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Text(
                      item.categoryModel.toUpperCase(),
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      children: <Widget>[
                        Text(
                          item.author,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            FadeRoute2(
                              SecondPage(item),
                            ),
                          ),
                          child: Text('Click'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  ItemModel _data;
  SecondPage(this._data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Detail Portofolio'),
      ),
      body: CardDetail(_data),
    );
  }
}
