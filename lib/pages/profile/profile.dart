import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/pages/profile/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ProfileSevenPage();
  }
}

class ProfileSevenPage extends StatelessWidget {
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
                        "User",
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
                      UserInfo()
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
                        subtitle: Text("Jakarta Timur" "\n Kec.Pisangan Timur"),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text("user@test.com"),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Phone"),
                        subtitle: Text("085767113554"),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        leading: Icon(Icons.person),
                        title: Text("About Me"),
                        subtitle: Text(
                            "This is a about me link and you can khow about me in this section."),
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
