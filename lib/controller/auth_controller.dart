import 'package:store_app/imports.dart';

class AuthController extends GetxController {
  var token = ''.obs;
  saveToken(String newToken) {
    token.value = newToken;
  }

  @override
  void onInit() {
    token.value = '';
    super.onInit();
  }

  clear() {
    token.value = '';
  }
}
