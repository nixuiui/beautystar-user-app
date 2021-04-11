// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mua_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MuaCategoryAdapter extends TypeAdapter<MuaCategory> {
  @override
  final int typeId = 5;

  @override
  MuaCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MuaCategory(
      id: fields[0] as int,
      vendorCategoryId: fields[1] as int,
      parentId: fields[2] as dynamic,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MuaCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.vendorCategoryId)
      ..writeByte(2)
      ..write(obj.parentId)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MuaCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
