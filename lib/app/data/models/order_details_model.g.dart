// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderDetailsModelAdapter extends TypeAdapter<OrderDetailsModel> {
  @override
  final int typeId = 10;

  @override
  OrderDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderDetailsModel(
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
      date: fields[11] as DateTime?,
      time: fields[12] as String?,
      address: fields[13] as String?,
      techVisitStatus: fields[14] as String?,
      warrantyClaimed: fields[15] as int?,
      images: (fields[16] as List?)?.cast<String>(),
      video: (fields[17] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderDetailsModel obj) {
    writer
      ..writeByte(17)
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
      ..write(obj.paymentType)
      ..writeByte(11)
      ..write(obj.date)
      ..writeByte(12)
      ..write(obj.time)
      ..writeByte(13)
      ..write(obj.address)
      ..writeByte(14)
      ..write(obj.techVisitStatus)
      ..writeByte(15)
      ..write(obj.warrantyClaimed)
      ..writeByte(16)
      ..write(obj.images)
      ..writeByte(17)
      ..write(obj.video);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
