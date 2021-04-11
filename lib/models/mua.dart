import 'dart:convert';

import 'package:beautystar_user_app/models/city.dart';
import 'package:beautystar_user_app/models/province.dart';
import 'package:indonesia/indonesia.dart';

List<Mua> muasFromJson(String str) => List<Mua>.from(json.decode(str).map((x) => Mua.fromJson(x)));

String muasToJson(List<Mua> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Mua muaFromJson(String str) => Mua.fromJson(json.decode(str));

String muaToJson(Mua data) => json.encode(data.toJson());

class Mua {
    Mua({
        this.id,
        this.rate,
        this.brandName,
        this.address,
        this.description,
        this.instagram,
        this.facebook,
        this.isVerified,
        this.verifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.portofolios,
        this.services,
        this.user,
        this.province,
        this.city,
    });

    int id;
    dynamic rate;
    String brandName;
    String address;
    String description;
    String instagram;
    String facebook;
    int isVerified;
    dynamic verifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    List<Portofolio> portofolios;
    List<Service> services;
    MuaOwner user;
    Province province;
    City city;

    factory Mua.fromJson(Map<String, dynamic> json) => Mua(
        id: json["id"],
        rate: json["rate"],
        brandName: json["brand_name"],
        address: json["address"],
        description: json["description"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        isVerified: json["is_verified"],
        verifiedAt: json["verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        portofolios: List<Portofolio>.from(json["portofolios"].map((x) => Portofolio.fromJson(x))),
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        user: MuaOwner.fromJson(json["user"]),
        province: Province.fromJson(json["province"]),
        city: City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rate": rate,
        "brand_name": brandName,
        "address": address,
        "description": description,
        "instagram": instagram == null ? null : instagram,
        "facebook": facebook == null ? null : facebook,
        "is_verified": isVerified,
        "verified_at": verifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "portofolios": List<dynamic>.from(portofolios.map((x) => x.toJson())),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "user": user.toJson(),
        "province": province.toJson(),
        "city": city.toJson(),
    };

    getMinPrice() {
      String rangePrice = "Rp. 0";
      if (services != null && services.isNotEmpty) {
        services.sort((a, b) => a.price.compareTo(b.price));
        rangePrice = rupiah(services.first.price.toString());
      }
      return rangePrice;
    }

    getRangePrice() {
      String rangePrice = "Rp. 0";
      if (services != null && services.isNotEmpty) {
        services.sort((a, b) => a.price.compareTo(b.price));
        rangePrice = rupiah(services.first.price.toString());
        if(services.length > 1) {
          rangePrice += " - " + rupiah(services.last.price.toString());
        }
      }
      return rangePrice;
    }
}

class Portofolio {
    Portofolio({
        this.photo,
        this.serviceId,
    });

    String photo;
    int serviceId;

    factory Portofolio.fromJson(Map<String, dynamic> json) => Portofolio(
        photo: json["photo"],
        serviceId: json["service_id"] == null ? null : json["service_id"],
    );

    Map<String, dynamic> toJson() => {
        "photo": photo,
        "service_id": serviceId == null ? null : serviceId,
    };
}

class Service {
    Service({
        this.id,
        this.muaId,
        this.vendorCategoryId,
        this.categoryId,
        this.name,
        this.description,
        this.price,
        this.promo,
        this.dpPrice,
        this.duration,
        this.minPerson,
        this.maxOrder,
        this.isServicePackage,
        this.isPremium,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    int muaId;
    int vendorCategoryId;
    int categoryId;
    String name;
    String description;
    int price;
    int promo;
    dynamic dpPrice;
    int duration;
    int minPerson;
    int maxOrder;
    int isServicePackage;
    int isPremium;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        muaId: json["mua_id"],
        vendorCategoryId: json["vendor_category_id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        promo: json["promo"] == null ? null : json["promo"],
        dpPrice: json["dp_price"],
        duration: json["duration"] == null ? null : json["duration"],
        minPerson: json["min_person"],
        maxOrder: json["max_order"] == null ? null : json["max_order"],
        isServicePackage: json["is_service_package"],
        isPremium: json["is_premium"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mua_id": muaId,
        "vendor_category_id": vendorCategoryId,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "price": price,
        "promo": promo == null ? null : promo,
        "dp_price": dpPrice,
        "duration": duration == null ? null : duration,
        "min_person": minPerson,
        "max_order": maxOrder == null ? null : maxOrder,
        "is_service_package": isServicePackage,
        "is_premium": isPremium,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class MuaOwner {
    MuaOwner({
        this.id,
        this.roleId,
        this.name,
        this.username,
        this.email,
        this.password,
        this.balance,
        this.gender,
        this.birthDate,
        this.profilePhoto,
        this.addressId,
        this.nik,
        this.noHp,
        this.address,
        this.phoneVerificationCode,
        this.isVerifiedAccount,
        this.emailVerificationCode,
        this.isEmailVerified,
        this.isTrashed,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int id;
    int roleId;
    String name;
    String username;
    String email;
    String password;
    int balance;
    int gender;
    DateTime birthDate;
    String profilePhoto;
    int addressId;
    dynamic nik;
    String noHp;
    dynamic address;
    dynamic phoneVerificationCode;
    int isVerifiedAccount;
    String emailVerificationCode;
    int isEmailVerified;
    int isTrashed;
    String rememberToken;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    factory MuaOwner.fromJson(Map<String, dynamic> json) => MuaOwner(
        id: json["id"],
        roleId: json["role_id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        balance: json["balance"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        profilePhoto: json["profile_photo"] == null ? null : json["profile_photo"],
        addressId: json["address_id"] == null ? null : json["address_id"],
        nik: json["nik"],
        noHp: json["no_hp"],
        address: json["address"],
        phoneVerificationCode: json["phone_verification_code"],
        isVerifiedAccount: json["is_verified_account"],
        emailVerificationCode: json["email_verification_code"] == null ? null : json["email_verification_code"],
        isEmailVerified: json["is_email_verified"],
        isTrashed: json["is_trashed"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "balance": balance,
        "gender": gender,
        "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "profile_photo": profilePhoto == null ? null : profilePhoto,
        "address_id": addressId == null ? null : addressId,
        "nik": nik,
        "no_hp": noHp,
        "address": address,
        "phone_verification_code": phoneVerificationCode,
        "is_verified_account": isVerifiedAccount,
        "email_verification_code": emailVerificationCode == null ? null : emailVerificationCode,
        "is_email_verified": isEmailVerified,
        "is_trashed": isTrashed,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}