import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_architect/api/api_order.dart';
import 'package:my_architect/api/api_review_post.dart';
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/model/history_model.dart';
import 'package:my_architect/model/item_model.dart';
import 'package:my_architect/model/order_model.dart';
import 'package:my_architect/model/price_model.dart';
import 'package:my_architect/model/review_model.dart';
import 'package:my_architect/pages/auth/auth_component/form_widget.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/pages/home.dart';
import 'package:my_architect/pages/root.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FormOrderHistory extends StatefulWidget {
  final HistoryModel item;
  const FormOrderHistory(this.item);
  @override
  _FormOrderHistoryState createState() => _FormOrderHistoryState();
}

class _FormOrderHistoryState extends State<FormOrderHistory> {
  TextEditingController commentController = new TextEditingController();
  ReviewRequestModel reviewRequestModel;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token;
  String valueRating = "1";
  List list_price = [];
  int _dropdownValue;
  // Widget.canUpdate(oldWidget, newWidget)

  bool hiddenPassword = true;
  var formKey = new GlobalKey<FormState>();
  void initState() {
    super.initState();
    reviewRequestModel = new ReviewRequestModel();
    _getToken();
    // _getPrice(widget.item);
  }

  Future<void> _getToken() async {
    final SharedPreferences prefs = await _prefs;
    token = prefs.getString('token');
    print(token);
  }

  // void _getPrice(HistoryModeltem) async {
  //   String BaseUrl = AppSetting.apirul;
  //   Uri url = Uri.parse(BaseUrl + "/price?user_id" + item.user_id);
  //   final response = await http.get(url);
  //   var jsonData = json.decode(response.body);
  //   print("jsonData");
  //   print(jsonData["data"]);

  //   if (jsonData["success"]) {
  //     for (var u in jsonData["data"]["price"]) {
  //       PriceModel project = PriceModel.fromJson(u);
  //       print(project);
  //       list_price.add(project);
  //     }
  //   }
  //   print("list_price.length");
  //   print(list_price.length);

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Order',
          textScaleFactor: 1.12,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 0, right: 10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    UserComponent.formUser(
                      'Komentar',
                      hint: 'Masukan Komentar',
                      type: TextInputType.multiline,
                      controller: commentController,
                      action: TextInputAction.newline,
                      minLines: 5,
                      maxLines: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                        valueRating = rating.round().toString();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 0),
                    child: OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 1.1,
                              color: Colors.black)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        if (commentController.text != '') {
                          reviewRequestModel.comment = commentController.text;
                          reviewRequestModel.star = valueRating;
                          reviewRequestModel.orderId = widget.item.id;

                          reviewRequestModel.token = token;

                          APIReviewPost apiReviewPost = new APIReviewPost();
                          apiReviewPost
                              .order(reviewRequestModel)
                              .then((value) async {
                            if (value.success) {
                              EasyLoading.dismiss();
                              Fluttertoast.showToast(
                                msg: "Berhasil Review",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blue,
                                fontSize: 16.0,
                              );

                              // log(loginController.authStorage
                              //     .read('isLogin')
                              //     .toString());

                              await Future.delayed(
                                Duration(milliseconds: 300),
                                () => Get.offAll(Root()),
                              );
                            } else {
                              EasyLoading.dismiss();
                              Fluttertoast.showToast(
                                msg: "Gagal Review",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                fontSize: 16.0,
                              );
                            }
                            // if (value != null) {
                            //   setState(() {
                            //     // isApiCallProcess = false;
                            //   });
                            // }
                          });
                        } else {
                          Fluttertoast.showToast(
                            msg: "Komentar Tidak Boleh Kosong",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            fontSize: 16.0,
                          );
                        }

                        // commentController;
                        // Navigator.pop(context);
                      },
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
