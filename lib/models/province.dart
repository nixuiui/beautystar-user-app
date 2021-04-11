import 'dart:convert';

import 'package:hive/hive.dart';

part 'province.g.dart';

List<Province> provinceFromJson(String str) => List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

String provinceToJson(List<Province> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 3)
class Province extends HiveObject {
    Province({
        this.id,
        this.name,
    });

    @HiveField(0)
    String id;
    @HiveField(1)
    String name;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
