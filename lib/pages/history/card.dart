import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/component/card_detail%20history.dart';
import 'package:my_architect/component/card_detail.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/model/history_model.dart';
import 'package:my_architect/model/item_model.dart';

class Lists extends StatelessWidget {
  final List<HistoryModel> _data;
  Lists(this._data);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        HistoryModel item = _data[index];
        return Card(
          elevation: 3,
          child: Row(
            children: <Widget>[
              Container(
                height: 90,
                width: 80,
                padding:
                    EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 5),
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
                          fontSize: 14),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Progres : \n" + item.progresAkhir,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      softWrap: false,
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
                          width: 50,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            FadeRoute2(
                              DetailHistory(item),
                            ),
                          ),
                          child: Text('Detail'),
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
  HistoryModel item;
  DetailHistory(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Detail History Pesanan'),
      ),
      body: CardDetailHistory(item),
    );
  }
}
