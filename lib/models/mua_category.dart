import 'dart:convert';

import 'package:hive/hive.dart';

part 'mua_category.g.dart';

List<MuaCategory> muaCategoriesFromJson(String str) => List<MuaCategory>.from(json.decode(str).map((x) => MuaCategory.fromJson(x)));

String muaCategoriesToJson(List<MuaCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 5)
class MuaCategory extends HiveObject {
    MuaCategory({
        this.id,
        this.vendorCategoryId,
        this.parentId,
        this.name,
    });

    @HiveField(0)
    int id;
    @HiveField(1)
    int vendorCategoryId;
    @HiveField(2)
    dynamic parentId;
    @HiveField(3)
    String name;

    factory MuaCategory.fromJson(Map<String, dynamic> json) => MuaCategory(
        id: json["id"],
        vendorCategoryId: json["vendor_category_id"],
        parentId: json["parent_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_category_id": vendorCategoryId,
        "parent_id": parentId,
        "name": name,
    };
}
