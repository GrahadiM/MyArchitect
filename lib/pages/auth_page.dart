import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_architect/component/const.dart';
import 'package:my_architect/pages/auth/login.dart';
import 'package:my_architect/pages/auth/register.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true).then((value) {
          SystemNavigator.pop();
          return true;
        });
      },
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/splash_icon.png',
                        scale: 5,
                      ),
                      height: 150,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'MyArchitect\n',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Temukan pekerja sesuai kebutuhan anda',
                          )
                        ]),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () => Get.to(
                        LoginPage(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: PRIMARY_COLOR,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () => Get.to(
                        RegisterPage(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
