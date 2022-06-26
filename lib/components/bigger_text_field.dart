import 'package:store_app/imports.dart';

class BiggerTextField extends StatelessWidget {
  const BiggerTextField({
    Key key,
    @required TextEditingController controller,
    this.text,
  })  : controller = controller,
        super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "$text: ",
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: SizeConfig.screenWidth * 0.9,
            child: TextFormField(
              style: TextStyle(fontSize: 18),
              controller: controller,
              decoration: InputDecoration(),
              maxLines: 4,
              minLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
