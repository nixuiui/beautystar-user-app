import 'dart:convert';

import 'package:hive/hive.dart';

part 'bank.g.dart';

List<Bank> bankFromJson(String str) => List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

String bankToJson(List<Bank> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 2)
class Bank extends HiveObject {
    Bank({
        this.id,
        this.name,
        this.code,
    });

    @HiveField(0)
    int id;
    @HiveField(1)
    String name;
    @HiveField(2)
    int code;

    factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        name: json["name"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
    };
}
