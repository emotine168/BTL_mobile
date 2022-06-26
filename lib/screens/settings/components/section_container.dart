import 'package:store_app/imports.dart';

class SettingsPart extends StatelessWidget {
  @override
  const SettingsPart({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: SectionCotainer(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(color: Colors.black),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
