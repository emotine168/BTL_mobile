import 'package:store_app/imports.dart';

class HeadingBar extends PreferredSize {
  HeadingBar({
    this.searchingText,
    Key key,
  });
  final searchingText;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 5),
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(15),
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: SvgPicture.asset(
                "assets/icons/Back ICon.svg",
                color: Colors.black,
              ),
            ),
            SearchBar(searchingText: searchingText),
            SvgPicture.asset(
              "assets/icons/Bell2.svg",
              color: Colors.lightGreen,
              height: getProportionateScreenHeight(30),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
    this.searchingText,
  }) : super(key: key);
  final searchingText;
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  TextEditingController _searchController;

  void initState() {
    _searchController = new TextEditingController(text: widget.searchingText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.7,
      height: getProportionateScreenHeight(45),
      child: TextFormField(
        controller: _searchController,
        onFieldSubmitted: (value) {
          Get.to(SearchScreen());
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(25, 10, 0, 10),
          hintText: "Search",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
