import 'package:store_app/imports.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final userController = Get.find<UserController>();
  final _selectLocationController = Get.find<SelectLocationController>();

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  TextEditingController _phoneNumberController =
      new TextEditingController(text: '');
  TextEditingController _receiverNameController =
      new TextEditingController(text: '');

  void addError({String error}) {
    setState(() {
      if (!errors.contains(error)) {
        errors.add(error);
      }
    });
  }

  void removeError({String error}) {
    setState(() {
      if (errors.contains(error)) {
        errors.remove(error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            buildPhoneNumberTextField(),
            SizedBox(
              height: 20,
            ),
            buildReceiverNameTextField(),
            CreateLocationButton(),
            CreateAndCancelButton(
              formKey: _formKey,
              phoneNumberController: _phoneNumberController,
              receiverNameController: _receiverNameController,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      onSaved: (newValue) {},
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter your phone number",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildReceiverNameTextField() {
    return TextFormField(
      controller: _receiverNameController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Receiver name",
        hintText: "Enter receiver name",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/User Icon.svg",
        ),
      ),
    );
  }
}
