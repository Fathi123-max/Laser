// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceTypeAdapter extends TypeAdapter<DeviceType> {
  @override
  final int typeId = 5;

  @override
  DeviceType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceType(
      id: fields[1] as int?,
      name: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceType obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
