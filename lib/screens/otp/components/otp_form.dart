import 'package:store_app/imports.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2focusNode;
  FocusNode pin3focusNode;
  FocusNode pin4focusNode;
  @override
  void initState() {
    super.initState();
    pin2focusNode = FocusNode();
    pin3focusNode = FocusNode();
    pin4focusNode = FocusNode();
  }

  void dispose() {
    pin2focusNode.dispose();
    pin3focusNode.dispose();
    pin4focusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            autofocus: true,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin2focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin2focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin3focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin3focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              nextField(value: value, focusNode: pin4focusNode);
            },
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(60),
          child: TextFormField(
            focusNode: pin4focusNode,
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
            keyboardType: TextInputType.number,
            decoration: otpInputDecoration,
            onChanged: (value) {
              pin4focusNode.unfocus();
            },
          ),
        ),
      ],
    );
  }
}
