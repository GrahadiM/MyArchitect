import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:my_architect/model/price_model.dart';
import 'package:my_architect/pages/arsitek/profil_arsitek.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/component/form_order.dart';
import 'package:http/http.dart' as http;

import '../app_setting.dart';

class CardDetail extends StatefulWidget {
  final ItemModel item;
  const CardDetail(this.item);
  //

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  List list_price = [];
  get user => '085767113554';

  void initState() {
    super.initState();
    list_price = [];
    _getPrice(widget.item);
  }

  void _getPrice(ItemModel item) async {
    String BaseUrl = AppSetting.apirul;
    Uri url = Uri.parse(BaseUrl + "/price?user_id=" + item.user_id);
    print(url);
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData["data"]);

    if (jsonData["success"]) {
      for (var u in jsonData["data"]["price"]) {
        PriceModel project = PriceModel.fromJson(u);
        print(project);
        list_price.add(project);
      }
    }
    print("list_price.length");
    print(list_price.length);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        ItemModel item = widget.item;
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
                      padding: const EdgeInsets.all(25),
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
                              GestureDetector(
                                onTap: () {
                                  print("ditekan fin");
                                  Navigator.push(
                                    context,
                                    FadeRoute2(
                                      ArsitekProfilePage(
                                          item.author, list_price),
                                    ),
                                  );
                                },

                                // onPressed: () => ,
                                child: Text(
                                  item.author,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              )
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
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "\nHarga : \n",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: true,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 0, top: 0, bottom: 20, right: 0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  for (PriceModel i in list_price)
                                    Text(
                                      " - " +
                                          i.name +
                                          " ( Rp . " +
                                          i.price +
                                          ") \nKeterangan : " +
                                          i.desc +
                                          "\n\n     \t",
                                      textAlign: TextAlign.start,
                                    )
                                ],
                              ),
                            ),
                          ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 0,
                      ),
                      child: Text(
                        item.price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Center(
                          child: IconButton(
                            iconSize: 32.0,
                            icon: const Icon(Icons.forward_to_inbox),
                            onPressed: () => launch('https://wa.me/$user'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            FadeRoute2(
                              FormOrder(item),
                            ),
                          ),
                          child: Text('Pesan'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
