import 'package:store_app/imports.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.id,
      this.email,
      this.address,
      this.gender,
      this.phoneNumber,
      this.birthday,
      this.userName,
      this.loves,
      this.cart,
      this.locations});

  String id = '';
  String email = '';
  String address = '';
  String gender = '';
  String phoneNumber = '';
  String birthday = '';
  String userName = '';
  List<Location> locations;
  List<String> loves;
  List<Cart> cart;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        address: json["address"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        birthday: json["birthday"],
        userName: json["userName"],
        loves: List<String>.from(json["loves"]),
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "address": address,
        "gender": gender,
        "phoneNumber": phoneNumber,
        "birthday": birthday,
        "userName": userName,
        "loves": loves,
        "locations": List<Location>.from(locations.map((x) => x.toJson())),
        "cart": List<Cart>.from(cart.map((x) => x.toJson())),
      };
}

class Cart {
  Cart({
    this.isChosen,
    this.productId,
    this.quantity,
  });

  bool isChosen;
  String productId;
  int quantity;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        isChosen: json["isChosen"],
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "isChosen": isChosen,
        "productId": productId,
        "quantity": quantity,
      };
}

class Location {
  Location({
    this.receiverName,
    this.phoneNumber,
    this.address,
    this.length,
  });

  String receiverName;
  String phoneNumber;
  String address;
  int length;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        receiverName: json["receiverName"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "receiverName": receiverName,
        "phoneNumber": phoneNumber,
        "address": address,
        "length": length,
      };
}
