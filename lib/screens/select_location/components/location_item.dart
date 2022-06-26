import 'package:store_app/imports.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key key,
    @required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<CheckOutController>().setLocation(location);
        Get.back();
      },
      child: ItemCardContainer(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: SizeConfig.screenWidth * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(location.receiverName, style: normalText),
                    SizedBox(height: 5),
                    Text(location.phoneNumber),
                    SizedBox(height: 5),
                    Text(location.address, maxLines: 2),
                  ],
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
        ),
      ),
    );
  }
}
