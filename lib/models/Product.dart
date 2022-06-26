import 'package:store_app/imports.dart';

List<Product> productsFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productsToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product(
      {this.images,
      this.id,
      this.title,
      this.description,
      this.price,
      this.type,
      this.love,
      this.rating});

  List<String> images;
  String id;
  String title;
  String description;
  String price;
  String type;
  bool love;
  int rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      images: List<String>.from(json["images"].map((x) => x)),
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      type: json["type"],
      love: json["love"],
      rating: json["rating"]);

  Map<String, dynamic> toJson() => {
        "images": json.encode(List<dynamic>.from(images.map((x) => x))),
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "type": type,
        "love": json.encode(love),
        "rating": json.encode(rating)
      };
}

const String description =
    "Chiếc điện thoại iPhone 12 Pro Max 256 GB là mẫu smartphone sở hữu nhiều tính năng nổi bật với hệ thống camera chất lượng, hiệu năng vượt trội hay hỗ trợ kết nối 5G hứa hẹn sẽ là mẫu sản phẩm mang lại cảm giác trải nghiệm tối ưu cho người dùng.";

List<String> productTypeList = [
  'Phone',
  'Watch',
  'Accessories',
  'Tablet',
  'Laptop'
];
