import 'package:store_app/imports.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required User user,
  })  : user = user,
        super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ItemCardContainer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.64,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // user name
                    Row(
                      children: [
                        SizedBox(
                          width: 46,
                          child: Icon(
                            Icons.person_outline_outlined,
                            size: 36,
                            color: kTextColor,
                          ),
                        ),
                        Text(
                          user.userName,
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                    //email
                    Row(
                      children: [
                        SizedBox(
                          width: 46,
                          child: Icon(
                            Icons.mail_outline_outlined,
                            size: 36,
                            color: kTextColor,
                          ),
                        ),
                        Text(user.email, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    // phone num
                    Row(
                      children: [
                        SizedBox(
                          width: 46,
                          child: Icon(
                            Icons.phone_android_outlined,
                            size: 36,
                            color: kTextColor,
                          ),
                        ),
                        Text(user.phoneNumber, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 20),
                    // id
                    Text('ID: ' + user.id),
                  ],
                ),
              ),
              // edit button
              GestureDetector(
                onTap: () {
                  Get.to(() => EditUserInfoScreen());
                },
                child: SizedBox(
                  width: 50,
                  child: Icon(
                    Icons.build_outlined,
                  ),
                ),
              ),
              //delete button
              SizedBox(
                width: 50,
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
