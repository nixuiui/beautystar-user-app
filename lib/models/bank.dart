import 'dart:convert';

List<Bank> bankFromJson(String str) => List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

String bankToJson(List<Bank> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bank {
    Bank({
        this.id,
        this.name,
        this.code,
    });

    int id;
    String name;
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
