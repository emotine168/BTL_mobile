import 'package:store_app/imports.dart';

List<Order> ordersFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String ordersToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.id,
    this.discount,
    this.status,
    this.user,
    this.items,
    this.shippingAddress,
    this.text,
    this.subTotal,
    this.total,
    this.shipping,
  });

  String id;
  String discount;
  String status;
  String user;
  List<ProductItem> items;
  Location shippingAddress;
  String text;
  String subTotal;
  String total;
  String shipping;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        discount: json["discount"],
        status: json["status"],
        user: json["user"],
        items: List<ProductItem>.from(
            json["items"].map((x) => ProductItem.fromJson(x))),
        shippingAddress: Location.fromJson(json["shippingAddress"]),
        text: json["text"],
        subTotal: json["subTotal"],
        total: json["total"],
        shipping: json["shipping"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "discount": discount,
        "status": status,
        "user": user,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "shippingAddress": shippingAddress.toJson(),
        "text": text,
        "subTotal": subTotal,
        "total": total,
        "shipping": shipping,
      };
}

class ProductItem {
  ProductItem({
    this.id,
    this.productId,
    this.quantity,
  });

  String id;
  String productId;
  int quantity;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["_id"],
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productId": productId,
        "quantity": quantity,
      };
}
