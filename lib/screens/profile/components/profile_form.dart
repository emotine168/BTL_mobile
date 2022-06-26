import 'package:store_app/imports.dart';

class ProfileForm extends StatefulWidget {
  final arg;

  const ProfileForm({Key key, this.arg}) : super(key: key);
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final User user = Get.find<UserController>().user.value;

  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _addressController;
  TextEditingController _userNameController;
  TextEditingController _phoneNumberController;
  TextEditingController _birthdayController;
  TextEditingController _genderController;

  @override
  void initState() {
    super.initState();
    if (user.email != null) {
      _emailController = new TextEditingController(text: user.email);
      _userNameController = new TextEditingController(text: user.userName);
      _birthdayController = new TextEditingController(text: user.birthday);
      _genderController = new TextEditingController(text: user.gender);
      _addressController = new TextEditingController(text: user.address);
      _phoneNumberController =
          new TextEditingController(text: user.phoneNumber);
    } else {
      // from Sign up
      _emailController = new TextEditingController(text: widget.arg['email']);
      _userNameController = new TextEditingController(text: '');
      _addressController = new TextEditingController(text: '');
      _phoneNumberController = new TextEditingController(text: '');
      _birthdayController = new TextEditingController(text: '');
      _genderController = new TextEditingController(text: '');
    }
  }

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
      child: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(22),
          right: getProportionateScreenWidth(22),
        ),
        child: Column(
          children: [
            buildEmailTextField(), //2
            SizedBox(height: 20),
            buildUserNameTextField(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: getProportionateScreenWidth(160),
                  child: buildBirthdayTextField(),
                ),
                Container(
                  width: getProportionateScreenWidth(160),
                  child: buildGenderTextField(),
                ),
              ],
            ),
            SizedBox(height: 20),
            buildAddressTextField(),
            SizedBox(height: 20),
            buildPhoneNumberTextField(),
            SizedBox(height: 20),
            ErrorsForm(errors: errors),
            SizedBox(height: 5),
            DefaultButton(
              text: "UPDATE",
              press: () async {
                if (widget.arg != null) {
                  // from register
                  if (_formKey.currentState.validate()) {
                    Map<String, String> data = {
                      'id': widget.arg['id'],
                      'userName': _userNameController.text,
                      'birthday': _birthdayController.text,
                      'gender': _genderController.text,
                      'address': _addressController.text,
                      'phoneNumber': _phoneNumberController.text,
                      'cart': json.encode([]),
                      'loves': json.encode([]),
                    };
                    await ApiServices.updateUser(data, widget.arg['id']);
                    login(widget.arg['email'], widget.arg['password']);
                  }
                } else {
                  // edit profile
                  if (_formKey.currentState.validate()) {
                    Map<String, String> data = {
                      'id': user.id,
                      'userName': _userNameController.text,
                      'birthday': _birthdayController.text,
                      'gender': _genderController.text,
                      'address': _addressController.text,
                      'phoneNumber': _phoneNumberController.text,
                    };
                    Get.find<UserController>().updateUserFromProfile(data);
                    Get.to(() => HomeScreen());
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      enabled: false,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Mail.svg",
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

  TextFormField buildAddressTextField() {
    return TextFormField(
      controller: _addressController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      onSaved: (newValue) {},
      validator: (value) {
        if (value.isEmpty && !errors.contains(kAddressNullError)) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }

  TextFormField buildUserNameTextField() {
    return TextFormField(
      controller: _userNameController,
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
        labelText: "User name",
        hintText: "Enter your user name",
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

  GestureDetector buildBirthdayTextField() {
    return GestureDetector(
      onTap: () {
        DateTime dt = _birthdayController.text != ''
            ? DateTime.parse(_birthdayController.text + " 00:00:00")
            : null;
        showDatePicker(
                context: context,
                initialDate: dt == null ? DateTime.now() : dt,
                firstDate: DateTime(1900),
                lastDate: DateTime(2030))
            .then((value) =>
                {_birthdayController.text = value.toString().substring(0, 10)});
      },
      child: Container(
        color: Colors.white,
        child: IgnorePointer(
          child: TextFormField(
            readOnly: true,
            controller: _birthdayController,
            decoration: InputDecoration(
              labelText: "Birthday",
              labelStyle: TextStyle(
                fontSize: getProportionateScreenHeight(25),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildGenderTextField() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Choose your gender"),
            content: buildGenderSelections(),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: IgnorePointer(
          child: TextFormField(
            readOnly: true,
            controller: _genderController,
            decoration: InputDecoration(
              labelText: "Gender",
              labelStyle: TextStyle(
                fontSize: getProportionateScreenHeight(25),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                surffixIcon: "assets/icons/User Icon.svg",
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildGenderSelections() {
    print(_genderController.text);
    return Container(
      height: SizeConfig.screenHeight * 0.12,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _genderController.text = "Male";
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.white,
                  child: IgnorePointer(
                    child: Checkbox(
                      value: _genderController.text == "Male",
                      onChanged: (value) {},
                      activeColor: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
              Text("Male"),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _genderController.text = "Female";
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.white,
                  child: IgnorePointer(
                    child: Checkbox(
                      value: _genderController.text == "Female",
                      onChanged: (value) {},
                      activeColor: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
              Text("Female"),
            ],
          ),
        ],
      ),
    );
  }
}
