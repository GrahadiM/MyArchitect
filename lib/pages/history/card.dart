import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/component/card_detail.dart';
import 'package:my_architect/component/animation_fade.dart';

class Item {
  final String title;
  final String categoryType;
  final String categoryModel;
  final String author;
  final String image;

  Item({
    this.title,
    this.categoryType,
    this.categoryModel,
    this.author,
    this.image,
  });
}

class Lists extends StatelessWidget {
  final List<Item> _data = [
    Item(
      title: 'Desain Rumah Sederhana',
      categoryType: 'rumah tinggal',
      categoryModel: 'minimalis',
      author: 'Freelancer',
      image:
          'https://raw.githubusercontent.com/GrahadiM/MyArchitect_Web/main/public/image/portofolio/step-1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = _data[index];
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
                              DetailHistory(),
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

class DetailHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Detail History Pesanan'),
      ),
      body: CardDetail(),
    );
  }
}