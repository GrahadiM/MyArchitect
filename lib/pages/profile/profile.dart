import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_architect/app_setting.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/model/user_model.dart';
import 'package:my_architect/pages/profile/edit_profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String BaseUrl = AppSetting.apirul;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int userId;
  UserModel dataUser;
  UserModel dataUserFake = UserModel.fromJson(json.decode(
      '{"id": 0, "name": "-", "email": "-",  "phone": "-", "address": "-", "city": "-"}'));

  @override
  void initState() {
    super.initState();
    dataUser = dataUserFake;
    _getUserId();
  }

  Future<void> _getUserId() async {
    final SharedPreferences prefs = await _prefs;
    userId = prefs.getInt('userId');
    print(userId);
    initialData();
  }

  void initialData() async {
    Uri url = Uri.parse(
        BaseUrl + "/akun/show?userId=".toString() + userId.toString());
    print(BaseUrl + "/akun/show?userId=".toString() + userId.toString());
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData);

    dataUser = UserModel.fromJson(jsonData["data"]["auth"]);

    setState(() {});
  }

  Widget build(BuildContext context) {
    return ProfileSevenPage(dataUser);
  }
}

class ProfileSevenPage extends StatelessWidget {
  UserModel dataUserModel;
  ProfileSevenPage(this.dataUserModel);
  static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, .9),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 330,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        FadeRoute2(
                          EditProfile(),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 90,
                        margin: EdgeInsets.only(top: 60),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                            'https://github.com/GrahadiM/MyArchitect_Web/blob/main/public/image/profile/admin.png?raw=true',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        dataUserModel.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(2),
                      ),
                      Text(
                        "Customer",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Visibility(visible: true, child: UserInfo(dataUserModel))
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  UserModel userDataModel;
  UserInfo(this.userDataModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        leading: Icon(Icons.my_location),
                        title: Text("Location"),
                        subtitle: Text(userDataModel.city != null
                            ? userDataModel.city.toString()
                            : '-' +
                                "\n" +
                                (userDataModel.address != null
                                    ? userDataModel.address.toString()
                                    : '-')),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text(userDataModel.email != null
                            ? userDataModel.email.toString()
                            : '-'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text(userDataModel.phone != null
                            ? userDataModel.phone.toString()
                            : '-'),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        leading: Icon(Icons.person),
                        title: Text("About Me"),
                        subtitle: Text(userDataModel.desc != null
                            ? userDataModel.desc.toString()
                            : '-'),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
