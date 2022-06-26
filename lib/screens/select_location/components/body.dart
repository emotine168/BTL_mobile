import 'package:store_app/imports.dart';

class Body extends StatelessWidget {
  var _locationListController = Get.put(SelectLocationController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                _locationListController.locationList.value.length,
                (index) => LocationItem(
                    location:
                        _locationListController.locationList.value[index]),
              ),
              CreateNewLocationButton()
            ],
          ),
        ),
      ),
    );
  }
}
