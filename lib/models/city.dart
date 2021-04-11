import 'dart:convert';

List<City> citiesFromJson(String str) => List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String citiesToJson(List<City> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
    City({
        this.id,
        this.name,
    });

    String id;
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
