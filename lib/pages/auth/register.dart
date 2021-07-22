import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_architect/component/back_button.dart';
import 'package:my_architect/component/const.dart';
import 'package:my_architect/helper/auth_controller.dart';
import 'package:my_architect/pages/auth/login.dart';
import 'package:my_architect/pages/auth_page.dart';

import 'auth_component/form_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController loginController = Get.find();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  bool hiddenPassword = true;
  bool hiddenPasswordConfirm = true;
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Hero(
                                      tag: 'head-auth',
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Text(
                                          "Daftar",
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
                            listForm(),
                            SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
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
                            LoginPage(),
                            duration: Duration(milliseconds: 500),
                          ),
                          borderRadius: BorderRadius.circular(5),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(
                              "Sudah punya akun ?",
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => tapRegister(),
                        child: Text("Daftar"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding listForm() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          UserComponent.formUser(
            'Username',
            hint: 'john',
            type: TextInputType.name,
            controller: nameController,
            action: TextInputAction.next,
          ),
          UserComponent.formUser(
            'Email',
            hint: 'john@mail.com',
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
                  hiddenPassword ? Icons.visibility_off : Icons.visibility,
                  color: PRIMARY_COLOR.withOpacity(hiddenPassword ? 0.5 : 1.0),
                ),
              ),
              onPressed: () => setState(() => hiddenPassword = !hiddenPassword),
              splashColor: Colors.transparent,
            ),
          ),
          UserComponent.formUser(
            'Confirm Password',
            obscure: hiddenPasswordConfirm,
            hint: 'Ulangi password',
            controller: confirmPasswordController,
            type: TextInputType.visiblePassword,
            suffix: IconButton(
              highlightColor: Colors.transparent,
              icon: new Container(
                width: 36.0,
                child: new Icon(
                  hiddenPasswordConfirm
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: PRIMARY_COLOR
                      .withOpacity(hiddenPasswordConfirm ? 0.5 : 1.0),
                ),
              ),
              onPressed: () => setState(
                  () => hiddenPasswordConfirm = !hiddenPasswordConfirm),
              splashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  tapRegister() async {
    if (formKey.currentState.validate()) {
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      EasyLoading.dismiss();

      Fluttertoast.showToast(
        msg: "Berhasil Login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        fontSize: 16.0,
      );

      await Future.delayed(
        Duration(milliseconds: 300),
        () => Get.to(
          LoginPage(),
          transition: Transition.downToUp,
          duration: Duration(milliseconds: 500),
        ),
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
  }
}
