import 'package:store_app/imports.dart';

class HeadingBar extends StatelessWidget implements PreferredSizeWidget {
  HeadingBar({
    this.openDrawer,
    Key key,
  });
  final GestureTapCallback openDrawer;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(10),
          getProportionateScreenWidth(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: openDrawer,
              child: SvgPicture.asset(
                "assets/icons/vmenu.svg",
                color: Colors.lightGreen,
              ),
            ),
            SearchBar(),
            SvgPicture.asset(
              "assets/icons/vbell.svg",
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
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth * 0.7,
      height: getProportionateScreenHeight(45),
      child: TextFormField(
        controller: _searchController,
        onFieldSubmitted: (value) {
          if (value != '') Get.to(SearchScreen(), arguments: value);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 10, 0, 10),
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
