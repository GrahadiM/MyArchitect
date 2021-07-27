import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_architect/component/back_button.dart';
import 'package:my_architect/component/const.dart';
import 'package:my_architect/helper/auth_controller.dart';
import 'package:my_architect/pages/auth/register.dart';
import 'package:my_architect/pages/auth_page.dart';
import 'package:my_architect/pages/root.dart';
import 'auth_component/form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController loginController = Get.find();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool hiddenPassword = true;
  var formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future<bool>.value(true).then((value) => Get.off(AuthPage()));
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Stack(
            children: [
              SizedBox.expand(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 33, left: 16),
                        child: CustomBackButton(),
                      ),
                      formLogin(),
                    ],
                  ),
                ),
              ),
              buttonLogin()
            ],
          ),
        ),
      ),
    );
  }

  Padding formLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Hero(
                    tag: 'head-auth',
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text("Masukkan data dengan benar"),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                UserComponent.formUser(
                  'Email',
                  hint: 'user@email.com',
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  action: TextInputAction.next,
                ),
                UserComponent.formUser(
                  'Password',
                  obscure: hiddenPassword,
                  hint: 'Masukkan password',
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  suffix: IconButton(
                    highlightColor: Colors.transparent,
                    icon: new Container(
                      width: 36.0,
                      child: new Icon(
                        hiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: PRIMARY_COLOR
                            .withOpacity(hiddenPassword ? 0.5 : 1.0),
                      ),
                    ),
                    onPressed: () =>
                        setState(() => hiddenPassword = !hiddenPassword),
                    splashColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Positioned buttonLogin() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 30,
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => Get.to(
                  RegisterPage(),
                  duration: Duration(milliseconds: 500),
                ),
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Belum punya akun ?",
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  await EasyLoading.show(
                    status: 'loading...',
                    maskType: EasyLoadingMaskType.black,
                  );

                  loginController.login(
                      emailController.text, passwordController.text);

                  EasyLoading.dismiss();
                  Fluttertoast.showToast(
                    msg: "Berhasil Login",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    fontSize: 16.0,
                  );

                  log(loginController.authStorage.read('isLogin').toString());

                  await Future.delayed(
                    Duration(milliseconds: 300),
                    () => Get.offAll(Root()),
                  );
                } else {
                  Fluttertoast.showToast(
                    msg: 'Kolom tidak boleh kosong',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: PRIMARY_COLOR,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text("Masuk"),
            )
          ],
        ),
      ),
    );
  }
}
