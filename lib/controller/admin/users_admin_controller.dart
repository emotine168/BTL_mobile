import 'package:store_app/imports.dart';

class UsersAdminPageController extends GetxController {
  var isLoading = true.obs;
  var users = List<User>().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    users.value = await ApiServices.fetchUsers();
    isLoading.value = false;
  }
}
