// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 0;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      id: fields[0] as int,
      nama: fields[1] as String,
      email: fields[2] as String,
      username: fields[3] as String,
      balance: fields[4] as int,
      gender: fields[5] as LibraryModel,
      birthDate: fields[6] as DateTime,
      profilePhoto: fields[7] as String,
      addressId: fields[8] as int,
      nik: fields[9] as dynamic,
      noHp: fields[10] as String,
      address: fields[11] as dynamic,
      phoneVerificationCode: fields[12] as dynamic,
      isVerifiedAccount: fields[13] as int,
      emailVerificationCode: fields[14] as dynamic,
      isEmailVerified: fields[15] as int,
      isTrashed: fields[16] as int,
      createdAt: fields[17] as DateTime,
      updatedAt: fields[18] as DateTime,
      token: fields[19] as String,
      password: fields[20] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.birthDate)
      ..writeByte(7)
      ..write(obj.profilePhoto)
      ..writeByte(8)
      ..write(obj.addressId)
      ..writeByte(9)
      ..write(obj.nik)
      ..writeByte(10)
      ..write(obj.noHp)
      ..writeByte(11)
      ..write(obj.address)
      ..writeByte(12)
      ..write(obj.phoneVerificationCode)
      ..writeByte(13)
      ..write(obj.isVerifiedAccount)
      ..writeByte(14)
      ..write(obj.emailVerificationCode)
      ..writeByte(15)
      ..write(obj.isEmailVerified)
      ..writeByte(16)
      ..write(obj.isTrashed)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.updatedAt)
      ..writeByte(19)
      ..write(obj.token)
      ..writeByte(20)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
