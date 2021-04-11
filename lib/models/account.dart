import 'dart:convert';

import 'package:beautystar_user_app/models/library_model.dart';
import 'package:hive/hive.dart';

part 'account.g.dart';

Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class Account extends HiveObject{
    Account({
        this.id,
        this.nama,
        this.email,
        this.username,
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
        this.createdAt,
        this.updatedAt,
        this.token,
        this.password,
    });

    @HiveField(0)
    int id;
    @HiveField(1)
    String nama;
    @HiveField(2)
    String email;
    @HiveField(3)
    String username;
    @HiveField(4)
    int balance;
    @HiveField(5)
    LibraryModel gender;
    @HiveField(6)
    DateTime birthDate;
    @HiveField(7)
    String profilePhoto;
    @HiveField(8)
    int addressId;
    @HiveField(9)
    dynamic nik;
    @HiveField(10)
    String noHp;
    @HiveField(11)
    dynamic address;
    @HiveField(12)
    dynamic phoneVerificationCode;
    @HiveField(13)
    int isVerifiedAccount;
    @HiveField(14)
    dynamic emailVerificationCode;
    @HiveField(15)
    int isEmailVerified;
    @HiveField(16)
    int isTrashed;
    @HiveField(17)
    DateTime createdAt;
    @HiveField(18)
    DateTime updatedAt;
    @HiveField(19)
    String token;
    @HiveField(20)
    String password;

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        username: json["username"],
        balance: json["balance"],
        gender: json["gender"] != null ? LibraryModel.fromJson(json["gender"]) : null,
        birthDate: json["birth_date"] != null ? DateTime.parse(json["birth_date"]) : null,
        profilePhoto: json["profile_photo"],
        addressId: json["address_id"],
        nik: json["nik"],
        noHp: json["no_hp"],
        address: json["address"],
        phoneVerificationCode: json["phone_verification_code"],
        isVerifiedAccount: json["is_verified_account"],
        emailVerificationCode: json["email_verification_code"],
        isEmailVerified: json["is_email_verified"],
        isTrashed: json["is_trashed"],
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
        token: json["token"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "username": username,
        "balance": balance,
        "gender": gender?.toJson(),
        "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "profile_photo": profilePhoto,
        "address_id": addressId,
        "nik": nik,
        "no_hp": noHp,
        "address": address,
        "phone_verification_code": phoneVerificationCode,
        "is_verified_account": isVerifiedAccount,
        "email_verification_code": emailVerificationCode,
        "is_email_verified": isEmailVerified,
        "is_trashed": isTrashed,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "token": token,
    };
    
    Map<String, dynamic> toJsonRegister() => {
        "name": nama,
        "username": username,
        "email": email,
        "gender": gender?.id,
        "no_hp": noHp,
        "password": password
    };
}