// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final List<Datum>? data;
  final int? totalProducts;
  final int? totalPages;
  final int? currentPage;
  final int? perPage;

  ProductModel({
    this.data,
    this.totalProducts,
    this.totalPages,
    this.currentPage,
    this.perPage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    totalProducts: json["totalProducts"],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    perPage: json["perPage"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "totalProducts": totalProducts,
    "totalPages": totalPages,
    "currentPage": currentPage,
    "perPage": perPage,
  };
}

class Datum {
  final int? id;
  final String? title;
  final bool? isNew;
  final String? oldPrice;
  final double? price;
  final double? discountedPrice;
  final String? description;
  final Category? category;
  final String? type;
  final int? stock;
  final String? brand;
  final List<String>? size;
  final String? image;
  final int? rating;

  Datum({
    this.id,
    this.title,
    this.isNew,
    this.oldPrice,
    this.price,
    this.discountedPrice,
    this.description,
    this.category,
    this.type,
    this.stock,
    this.brand,
    this.size,
    this.image,
    this.rating,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    title: json["title"],
    isNew: json["isNew"],
    oldPrice: json["oldPrice"],
    price: json["price"]?.toDouble(),
    discountedPrice: json["discountedPrice"]?.toDouble(),
    description: json["description"],
    category: categoryValues.map[json["category"]],
    type: json["type"],
    stock: json["stock"],
    brand: json["brand"],
    size: json["size"] == null
        ? []
        : List<String>.from(json["size"]!.map((x) => x)),
    image: json["image"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "isNew": isNew,
    "oldPrice": oldPrice,
    "price": price,
    "discountedPrice": discountedPrice,
    "description": description,
    "category": categoryValues.reverse[category],
    "type": type,
    "stock": stock,
    "brand": brand,
    "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
    "image": image,
    "rating": rating,
  };
}

enum Category { KIDS, MEN, WOMEN }

final categoryValues = EnumValues({
  "kids": Category.KIDS,
  "men": Category.MEN,
  "women": Category.WOMEN,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
