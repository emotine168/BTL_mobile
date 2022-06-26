import 'package:store_app/imports.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _rePasswordController = new TextEditingController();

  bool rememberPassword = false;

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
            buildEmailTextField(),
            SizedBox(height: 20),
            buildPasswordTextField(),
            SizedBox(height: 20),
            buildRePasswordTextField(),
            SizedBox(height: 20),
            ErrorsForm(errors: errors),
            SizedBox(height: 25),
            DefaultButton(
              text: "SEND OTP",
              press: () {
                if (_formKey.currentState.validate()) {
                  ApiServices.register(
                          _emailController.text, _passwordController.text)
                      .then((response) => {
                            if (response != null)
                              {
                                Get.to(() => OtpScreen(), arguments: {
                                  "id": response,
                                  "email": _emailController.text,
                                  "password": _passwordController.text,
                                })
                              }
                            else
                              Get.snackbar(
                                  "Notification", "Something went wrong")
                          });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6 && !errors.contains(kShortPassError)) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildRePasswordTextField() {
    return TextFormField(
      controller: _rePasswordController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length > 6) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6 && !errors.contains(kShortPassError)) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        labelStyle: TextStyle(
          fontSize: getProportionateScreenHeight(25),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          surffixIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
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
}
