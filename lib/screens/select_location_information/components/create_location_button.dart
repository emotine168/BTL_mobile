import 'package:store_app/imports.dart';

class CreateLocationButton extends StatelessWidget {
  CreateLocationButton({
    Key key,
  }) : super(key: key);

  var _selectLocationController = Get.find<SelectLocationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          Get.to(() => ChooseLocationOnMapScreen());
        },
        child: ItemCardContainer(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                      width: SizeConfig.screenWidth * 0.7,
                      child: Text(
                        "Choose new location",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        "assets/icons/Location point.svg",
                        height: 25,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
                _selectLocationController.location.value != ''
                    ? Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(_selectLocationController.location.value),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
