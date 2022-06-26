import 'package:store_app/imports.dart';

List<Discount> discountsFromJson(String str) =>
    List<Discount>.from(json.decode(str).map((x) => Discount.fromJson(x)));

String discountsToJson(List<Discount> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Discount discountFromJson(String str) => Discount.fromJson(json.decode(str));

String discountToJson(Discount data) => json.encode(data.toJson());

class Discount {
  Discount({
    this.name,
    this.type,
    this.value,
    this.startDate,
    this.endDate,
  });

  String name;
  String type;
  String value;
  DateTime startDate;
  DateTime endDate;

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        name: json["name"],
        type: json["type"],
        value: json["value"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "value": value,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}
