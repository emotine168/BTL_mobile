import 'package:store_app/imports.dart';

class CreateNewLocationButton extends StatelessWidget {
  const CreateNewLocationButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SelectLocationInformationScreen());
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
                child: Text("Create new", style: normalText),
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
