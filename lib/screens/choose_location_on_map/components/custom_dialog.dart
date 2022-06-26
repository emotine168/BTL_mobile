import 'package:store_app/imports.dart';

class CustomDialog extends StatelessWidget {
  var _selectLocationController = Get.find<SelectLocationController>();
  final Suggestion suggestionSelected;

  CustomDialog({Key key, this.suggestionSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        height: SizeConfig.screenHeight * 0.18,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Text(
              'Length: ${_selectLocationController.length.value} meters',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.35,
                  child: DefaultButton(
                    text: "SELECT",
                    press: () {
                      _selectLocationController
                          .saveLocation(suggestionSelected.place.title);
                      Get.back();
                    },
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.35,
                  child: DefaultButton(
                    text: "CANCEL",
                    press: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
