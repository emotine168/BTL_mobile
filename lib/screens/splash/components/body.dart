import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
    {
      "image": "assets/images/splash_2.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
    {
      "image": "assets/images/splash_3.svg",
      "text": "Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Text(
                "WELCOME",
                style: headingStyle,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.45,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SpashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]["text"],
                  ),
                ),
              ),
              PageDots(splashData: splashData, currentPage: currentPage),
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: DefaultButton(
                  text: "Continue",
                  press: () {
                    Get.to(() => LoginScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
