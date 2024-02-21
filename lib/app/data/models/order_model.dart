import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 9)
class OrderModel extends HiveObject {
  @HiveField(1)
  final int? orderId;
  @HiveField(2)
  final String? deviceTypeImage;
  @HiveField(3)
  final String? deviceName;
  @HiveField(4)
  final String? services;
  @HiveField(5)
  final int? totalPrice;
  @HiveField(6)
  final int? currentStatusId;
  @HiveField(7)
  final String? currentStatusName;
  @HiveField(8)
  final String? currentStatusColor;
  @HiveField(9)
  final String? nextStatusName;
  @HiveField(10)
  final String? paymentType;

  OrderModel({
    this.orderId,
    this.deviceTypeImage,
    this.deviceName,
    this.services,
    this.totalPrice,
    this.currentStatusId,
    this.currentStatusName,
    this.currentStatusColor,
    this.nextStatusName,
    this.paymentType,
  });

  OrderModel copyWith({
    int? orderId,
    String? deviceTypeImage,
    String? deviceName,
    String? services,
    int? totalPrice,
    int? currentStatusId,
    String? currentStatusName,
    String? currentStatusColor,
    String? nextStatusName,
    String? paymentType,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        deviceTypeImage: deviceTypeImage ?? this.deviceTypeImage,
        deviceName: deviceName ?? this.deviceName,
        services: services ?? this.services,
        totalPrice: totalPrice ?? this.totalPrice,
        currentStatusId: currentStatusId ?? this.currentStatusId,
        currentStatusName: currentStatusName ?? this.currentStatusName,
        currentStatusColor: currentStatusColor ?? this.currentStatusColor,
        nextStatusName: nextStatusName ?? this.nextStatusName,
        paymentType: paymentType ?? this.paymentType,
      );

  //to json
  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'deviceTypeImage': deviceTypeImage,
        'deviceName': deviceName,
        'services': services,
        'totalPrice': totalPrice,
        'currentStatusId': currentStatusId,
        'currentStatusName': currentStatusName,
        'currentStatusColor': currentStatusColor,
        'nextStatusName': nextStatusName,
        'paymentType': paymentType,
      };

  //from json
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'] as int?,
      deviceTypeImage: json['deviceTypeImage'] as String?,
      deviceName: json['deviceName'] as String?,
      services: json['services'] as String?,
      totalPrice: json['totalPrice'] as int?,
      currentStatusId: json['currentStatusId'] as int?,
      currentStatusName: json['currentStatusName'] as String?,
      currentStatusColor: json['currentStatusColor'] as String?,
      nextStatusName: json['nextStatusName'] as String?,
      paymentType: json['paymentType'] as String?,
    );
  }
}
