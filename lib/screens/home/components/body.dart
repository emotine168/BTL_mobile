import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> hotDealList = [
    "assets/images/hot_deal_1.png",
    "assets/images/hot_deal_2.png",
    "assets/images/hot_deal_3.png"
  ];
  List<String> bannerList = [
    "assets/images/banner_1.png",
    "assets/images/banner_2.png",
    "assets/images/banner_3.png",
    "assets/images/banner_4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Hot deals",
                      press: () {},
                    ),
                    HotDeals(hotDealList: hotDealList),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Hot deals",
                      press: () {},
                    ),
                    Categories()
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Hot products",
                      press: () {
                        Get.to(() => ProductListPageScreen());
                      },
                    ),
                    SpecialProducts(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCotainer(
                child: Column(
                  children: [
                    TitlePart(
                      text: "Recommend for you",
                      press: () {
                        // Get.to(() => ProductListPageScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
