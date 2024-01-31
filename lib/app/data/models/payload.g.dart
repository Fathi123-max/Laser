// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PayloadAdapter extends TypeAdapter<Payload> {
  @override
  final int typeId = 3;

  @override
  Payload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payload(
      token: fields[0] as String?,
      user: fields[1] as User?,
      msg: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Payload obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.msg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
