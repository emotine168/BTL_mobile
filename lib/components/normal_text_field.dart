import 'package:store_app/imports.dart';

class NormalField extends StatefulWidget {
  const NormalField({
    Key key,
    @required TextEditingController controller,
    this.text,
  })  : controller = controller,
        super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  _NormalFieldState createState() => _NormalFieldState();
}

class _NormalFieldState extends State<NormalField> {
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${widget.text}: ",
                style: TextStyle(fontSize: 24),
              ),
              Expanded(
                child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  controller: widget.controller,
                  decoration: InputDecoration(),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isError = false;
                      });
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        isError = true;
                      });
                      return "";
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
          isError
              ? Text(
                  "Please enter this field !",
                  style: TextStyle(color: Colors.red),
                )
              : Container(),
        ],
      ),
    );
  }
}
