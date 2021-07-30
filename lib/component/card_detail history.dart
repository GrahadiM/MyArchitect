import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:my_architect/component/form_order%20history.dart';
import 'package:my_architect/model/history_model.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/component/form_order.dart';

class CardDetailHistory extends StatefulWidget {
  final HistoryModel item;
  const CardDetailHistory(this.item);
  //

  @override
  _CardDetailHistoryState createState() => _CardDetailHistoryState();
}

class _CardDetailHistoryState extends State<CardDetailHistory> {
  get user => '085767113554';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        HistoryModel item = widget.item;
        print("item");
        print(item);
        return Card(
          elevation: 3,
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w900,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Type : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                item.categoryType.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Model : ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                item.categoryModel.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Author : ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                item.author,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "\nDeskripsi : \n",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  item.desc,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  top: 0,
                  bottom: 15,
                  right: 15,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Progres ",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: item.progress.length > 0 ? true : false,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 20, right: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      for (var i in item.progress)
                        Text(
                          " - " + i["name"].toString(),
                          textAlign: TextAlign.start,
                        )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: item.progress.length > 0 ? false : true,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 20, right: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Belum Ada Progress",
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 20, right: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ElevatedButton(
                        // onPressed: () => print("ditekan"),
                        onPressed: () => Navigator.push(
                          context,
                          FadeRoute2(
                            FormOrderHistory(item),
                          ),
                        ),
                        child: Text('Berikan Review'),
                      ),
                    ],
                  ),
                ),
              )
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   // crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     ElevatedButton(
              //       onPressed: () => print("ditekan"),
              //       // onPressed: () => Navigator.push(
              //       //   context,
              //       //   FadeRoute2(
              //       //     FormOrder(item),
              //       //   ),
              //       // ),
              //       child: Text('Berikan Review'),
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      },
    );
  }
}
