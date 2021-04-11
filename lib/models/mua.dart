import 'dart:convert';

List<Mua> muaFromJson(String str) => List<Mua>.from(json.decode(str).map((x) => Mua.fromJson(x)));

String muaToJson(List<Mua> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mua {
    Mua({
        this.id,
        this.userId,
        this.rate,
        this.brandName,
        this.provinceId,
        this.cityId,
        this.address,
        this.description,
        this.instagram,
        this.facebook,
        this.isVerified,
        this.verifiedAt,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    int userId;
    dynamic rate;
    String brandName;
    int provinceId;
    int cityId;
    String address;
    String description;
    dynamic instagram;
    dynamic facebook;
    int isVerified;
    dynamic verifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Mua.fromJson(Map<String, dynamic> json) => Mua(
        id: json["id"],
        userId: json["user_id"],
        rate: json["rate"],
        brandName: json["brand_name"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        address: json["address"],
        description: json["description"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        isVerified: json["is_verified"],
        verifiedAt: json["verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "rate": rate,
        "brand_name": brandName,
        "province_id": provinceId,
        "city_id": cityId,
        "address": address,
        "description": description,
        "instagram": instagram,
        "facebook": facebook,
        "is_verified": isVerified,
        "verified_at": verifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
