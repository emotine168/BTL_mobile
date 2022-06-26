import 'package:store_app/imports.dart';

class LocationSelection extends StatelessWidget {
  final Location locationSelected;

  const LocationSelection({
    Key key,
    this.locationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SelectLocationScreen());
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey[300]),
        ),
        child: Row(
          children: [
            Text(
              "Take your location",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            locationSelected != null
                ? Row(
                    children: [
                      locationSelected.receiverName != null
                          ? Container(
                              width: SizeConfig.screenWidth * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    locationSelected.receiverName,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  SizedBox(height: 5),
                                  Text(locationSelected.phoneNumber),
                                  SizedBox(height: 5),
                                  Text(locationSelected.address, maxLines: 2),
                                ],
                              ),
                            )
                          : Text(""),
                      SizedBox(width: 10),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: SvgPicture.asset("assets/icons/arrow_right.svg"),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
