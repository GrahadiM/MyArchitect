import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_architect/component/const.dart';
import 'package:my_architect/component/custom_textformfield.dart';
import 'package:my_architect/helper/auth_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = Get.find();
  TextEditingController daerahController = new TextEditingController();
  TextEditingController kategoriController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Cari berdasarkan daerah",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Mencari asisten rumah tangga berdasarkan daerah di DKI Jakarta",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormfield(
                        hint: 'Pilih nama daerah',
                        controller: daerahController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormfield(
                        hint: 'Pilih nama daerah',
                        controller: daerahController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cari",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      color: PRIMARY_COLOR,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Hi, Icha !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    categoryIcon(
                      'assets/category/daily_icon.png',
                      'One Day Service',
                    ),
                    categoryIcon(
                      'assets/category/keeper_icon.png',
                      'Penjaga',
                    ),
                    categoryIcon(
                      'assets/category/driver_icon.png',
                      'Supir',
                    ),
                    categoryIcon(
                      'assets/category/kebun_icon.png',
                      'Tukang Kebun',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    categoryIcon(
                      'assets/category/sitter_icon.png',
                      'Asuh Anak',
                    ),
                    categoryIcon(
                      'assets/category/jompo_icon.png',
                      'Rawat Jompo',
                    ),
                    categoryIcon(
                      'assets/category/cuci_icon.png',
                      'Cuci',
                    ),
                    categoryIcon(
                      'assets/category/kebun_icon.png',
                      'Tukang Kebun',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded categoryIcon(String image, title) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    image,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
