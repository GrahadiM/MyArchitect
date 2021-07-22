import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_architect/helper/auth_controller.dart';
import 'package:my_architect/pages/auth_page.dart';
import 'package:my_architect/pages/home.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Get.find<AuthController>().isLogin.value ? HomePage() : AuthPage());
  }
}
