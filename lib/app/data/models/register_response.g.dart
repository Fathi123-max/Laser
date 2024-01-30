// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisterResponseAdapter extends TypeAdapter<RegisterResponse> {
  @override
  final int typeId = 4;

  @override
  RegisterResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegisterResponse(
      status: fields[0] as bool,
      error: fields[1] as bool,
      message: fields[2] as String,
      payload: fields[3] as Payload,
    );
  }

  @override
  void write(BinaryWriter writer, RegisterResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.error)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.payload);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
