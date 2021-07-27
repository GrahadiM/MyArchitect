import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_architect/api/api_edit_profil.dart';
import 'package:my_architect/model/edit_profil_model.dart';
import 'package:my_architect/model/user_model.dart';
import 'package:my_architect/pages/auth/auth_component/form_widget.dart';
import 'package:my_architect/component/animation_fade.dart';
import 'package:my_architect/pages/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileSettingsPage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/profilesettings.dart";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  EditProfilRequestModel editProfilRequestModel;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int userId;
  UserModel dataUser;

  bool hiddenPassword = true;
  var formKey = new GlobalKey<FormState>();
  void initState() {
    super.initState();
    editProfilRequestModel = new EditProfilRequestModel();
    _getUserId();
  }

  @override
  Future<void> _getUserId() async {
    final SharedPreferences prefs = await _prefs;
    userId = prefs.getInt('userId');
    print(userId);
    setState(() {});
    initialData();
  }

  void initialData() async {
    Uri url = Uri.parse(
        "http://192.168.43.183/flutter/public/api/akun/show?userId="
                .toString() +
            userId.toString());
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print("jsonData");
    print(jsonData);
    print(jsonData["data"]);

    dataUser = UserModel.fromJson(jsonData["data"]["auth"]);
    nameController.text = dataUser.name;
    phoneController.text = dataUser.phone;
    descriptionController.text = dataUser.desc;
    cityController.text = dataUser.city;
    addressController.text = dataUser.address;
    emailController.text = dataUser.email;

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
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
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://github.com/GrahadiM/MyArchitect_Web/blob/main/public/image/profile/admin.png?raw=true',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    UserComponent.formUser(
                      'Username',
                      hint: 'User',
                      type: TextInputType.name,
                      controller: nameController,
                      action: TextInputAction.next,
                    ),
                    UserComponent.formUser(
                      'Phone',
                      hint: '085767113554',
                      type: TextInputType.phone,
                      controller: phoneController,
                      action: TextInputAction.next,
                    ),
                    UserComponent.formUser(
                      'Description',
                      hint:
                          'This is a about me link and you can khow about me in this section.',
                      type: TextInputType.name,
                      controller: descriptionController,
                      action: TextInputAction.next,
                    ),
                    UserComponent.formUser(
                      'City',
                      hint: 'Jakarta Timur',
                      type: TextInputType.name,
                      controller: cityController,
                      action: TextInputAction.next,
                    ),
                    UserComponent.formUser(
                      'Address',
                      hint: 'Kec.Pisangan Timur',
                      type: TextInputType.name,
                      controller: addressController,
                      action: TextInputAction.next,
                    ),
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
                            color: Colors.blue
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
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(nameController.text);
                      print(phoneController.text);
                      print(descriptionController.text);
                      print(cityController.text);
                      print(addressController.text);
                      print(emailController.text);
                      print(passwordController.text);

                      // print(widget.item.id);
                      editProfilRequestModel.username = nameController.text;
                      editProfilRequestModel.phone = phoneController.text;
                      editProfilRequestModel.description =
                          descriptionController.text;
                      editProfilRequestModel.city = cityController.text;
                      editProfilRequestModel.address = addressController.text;
                      editProfilRequestModel.email = emailController.text;
                      editProfilRequestModel.password = passwordController.text;

                      // editProfilRequestModel.order_id = widget.item;

                      APIEditProfil apiService = new APIEditProfil();
                      apiService
                          .edit(editProfilRequestModel)
                          .then((value) async {
                        if (value.success) {
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(
                            msg: "Berhasil Edit Profil",
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
                            () => Get.offAll(Profile()),
                          );
                        } else {
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(
                            msg: "Gagal Edit Profil",
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
                      // nameController;
                      // Navigator.pop(context);
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
