import 'package:store_app/imports.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
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
        padding: EdgeInsets.only(left: 22, right: 22),
        child: Column(
          children: [
            buildEmailTextField(),
            SizedBox(height: 20),
            buildPasswordTextField(),
            SizedBox(height: 5),
            rememberAndForgotPassword(),
            ErrorsForm(errors: errors),
            socialMedia(),
            SizedBox(height: 25),
            DefaultButton(
              text: "LOGIN",
              press: () async {
                if (_formKey.currentState.validate()) {
                  await login(_emailController.text, _passwordController.text);
                }
              },
            ),
            signUp(),
          ],
        ),
      ),
    );
  }

  Container signUp() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        children: [
          Spacer(),
          Text(
            "Don't have an account ? ",
            style: TextStyle(fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            child: Text(
              "Sign up",
              style:
                  TextStyle(decoration: TextDecoration.underline, fontSize: 16),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  Row rememberAndForgotPassword() {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberPassword,
              onChanged: (value) {
                setState(() {
                  value = rememberPassword;
                });
              },
            ),
            Text("Remember password"),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
          },
          child: Text(
            "Forgot password",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  Row socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Or sign in with "),
        SizedBox(width: 5),
        SvgPicture.asset("assets/icons/facebook-2.svg"),
        SizedBox(width: 15),
        SvgPicture.asset("assets/icons/google-icon.svg"),
        SizedBox(width: 15),
        SvgPicture.asset("assets/icons/twitter.svg"),
        SizedBox(width: 15),
      ],
    );
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
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
        } else if (value.length < 6 &&
            !errors.contains(kShortPassError) &&
            !errors.contains(kPassNullError)) {
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

login(String email, String password) async {
  var response = await ApiServices.login(email, password);

  if (response != null) {
    Get.find<AuthController>().saveToken(response);
    Get.find<UserController>().setUserInfo();
    Get.to(() => LoginSuccessScreen());
  } else
    Get.snackbar("Notification", "Email or password is wrong");
}
