import 'dart:convert';

import 'package:hive/hive.dart';

part 'library_model.g.dart';

List<LibraryModel> libraryModelFromJson(String str) => List<LibraryModel>.from(json.decode(str).map((x) => LibraryModel.fromJson(x)));

String libraryModelToJson(List<LibraryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class LibraryModel extends HiveObject {
    LibraryModel({
        this.id,
        this.categoryId,
        this.name,
    });

    @HiveField(0)
    int id;
    @HiveField(1)
    String name;
    @HiveField(2)
    int categoryId;

    factory LibraryModel.fromJson(Map<String, dynamic> json) => LibraryModel(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
    };
}

enum CategoryEnum {
  Role,
  Gender,
  OrderStatus,
  PaymentType,
  PaymentMethod,
  FinanceReport,
  UserBalanceHistory
}

Map<CategoryEnum, int> categories = {
  CategoryEnum.Role: 10,
  CategoryEnum.Gender: 11,
  CategoryEnum.OrderStatus: 12,
  CategoryEnum.PaymentType: 13,
  CategoryEnum.PaymentMethod: 14,
  CategoryEnum.FinanceReport: 15,
  CategoryEnum.UserBalanceHistory: 16
};