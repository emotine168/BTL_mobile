import 'package:store_app/imports.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
          ),
          Row(
            children: [
              //avatar
              Container(
                width: SizeConfig.screenWidth * 0.35,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/avt.jpg",
                  ),
                ),
              ),
              // info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tran Van Cong",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                  Text(
                    "Score: 123",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
