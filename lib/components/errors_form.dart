import 'package:store_app/imports.dart';

class ErrorsForm extends StatelessWidget {
  const ErrorsForm({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        ...List.generate(
          errors.length,
          (index) => Row(
            children: [
              SvgPicture.asset("assets/icons/Error.svg"),
              SizedBox(width: getProportionateScreenWidth(5)),
              Text(
                errors[index],
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
