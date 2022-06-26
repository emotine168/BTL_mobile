import 'package:store_app/imports.dart';

class CreateAndCancelButton extends StatelessWidget {
  CreateAndCancelButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController phoneNumberController,
    @required TextEditingController receiverNameController,
  })  : _formKey = formKey,
        _phoneNumberController = phoneNumberController,
        _receiverNameController = receiverNameController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  var _selectLocationController = Get.find<SelectLocationController>();
  final TextEditingController _phoneNumberController;
  final TextEditingController _receiverNameController;
  var _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWithShadow(
            text: Text(
              "CREATE",
              style: TextStyle(
                fontSize: 24,
                color: kPrimaryColor,
              ),
            ),
            press: () {
              if (_formKey.currentState.validate()) {
                if (_selectLocationController.location.value != '') {
                  Location newLocation = Location(
                    phoneNumber: _phoneNumberController.text,
                    address: _selectLocationController.location.value,
                    receiverName: _receiverNameController.text,
                    length: _selectLocationController.length.value,
                  );
                  _userController.addNewLocation(newLocation);
                  _selectLocationController
                      .saveLocationList(_userController.user.value.locations);
                  Get.back();
                }
              }
            },
          ),
          ButtonWithShadow(
            text: Text(
              "CANCEL",
              style: TextStyle(
                fontSize: 24,
                color: kSecondaryColor,
              ),
            ),
            press: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
