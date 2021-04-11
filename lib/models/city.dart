import 'dart:convert';

import 'package:hive/hive.dart';

part 'city.g.dart';

List<City> citiesFromJson(String str) => List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String citiesToJson(List<City> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 4)
class City extends HiveObject {
    City({
        this.id,
        this.name,
    });

    @HiveField(0)
    String id;
    @HiveField(1)
    String name;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
