// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 9;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      orderId: fields[1] as int?,
      deviceTypeImage: fields[2] as String?,
      deviceName: fields[3] as String?,
      services: fields[4] as String?,
      totalPrice: fields[5] as int?,
      currentStatusId: fields[6] as int?,
      currentStatusName: fields[7] as String?,
      currentStatusColor: fields[8] as String?,
      nextStatusName: fields[9] as String?,
      paymentType: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.orderId)
      ..writeByte(2)
      ..write(obj.deviceTypeImage)
      ..writeByte(3)
      ..write(obj.deviceName)
      ..writeByte(4)
      ..write(obj.services)
      ..writeByte(5)
      ..write(obj.totalPrice)
      ..writeByte(6)
      ..write(obj.currentStatusId)
      ..writeByte(7)
      ..write(obj.currentStatusName)
      ..writeByte(8)
      ..write(obj.currentStatusColor)
      ..writeByte(9)
      ..write(obj.nextStatusName)
      ..writeByte(10)
      ..write(obj.paymentType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
