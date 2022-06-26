import 'package:store_app/imports.dart';

class SelectLocationController extends GetxController {
  var location = ''.obs;
  var locationList = List<Location>().obs;
  var length = 0.obs;

  @override
  void onInit() {
    fetchLocationList();
    super.onInit();
  }

  fetchLocationList() async {
    locationList.value = Get.find<UserController>().user.value.locations;
  }

  saveLocationList(List<Location> newLocationList) {
    print("save");
    locationList.value = [];
    locationList.value = newLocationList;
  }

  saveLocation(String newLocation) {
    location.value = newLocation;
  }

  setLength(int lengthh) {
    length.value = lengthh;
  }

  clear() {
    location.value = '';
  }
}
