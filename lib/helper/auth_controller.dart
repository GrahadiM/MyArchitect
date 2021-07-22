import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage authStorage = GetStorage('authStorage');
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  checkAuth() {
    if (authStorage.read('isLogin') == null || !authStorage.read('isLogin')) {
      isLogin.value = false;
      authStorage.write('isLogin', false);
    } else {
      isLogin.value = true;
      authStorage.write('isLogin', true);
    }
  }

  login(String email, password) {
    authStorage.write('isLogin', true);
    isLogin.value = true;
  }

  logOut() {
    authStorage.write('isLogin', false);
    isLogin.value = false;
  }
}
