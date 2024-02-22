import 'package:hive/hive.dart';

part 'order_details_model.g.dart';

@HiveType(typeId: 10)
class OrderDetailsModel extends HiveObject {
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
  @HiveField(11)
  final DateTime? date;
  @HiveField(12)
  final String? time;
  @HiveField(13)
  final String? address;
  @HiveField(14)
  final String? techVisitStatus;
  @HiveField(15)
  final int? warrantyClaimed;
  @HiveField(16)
  final List<String>? images;
  @HiveField(17)
  final List<dynamic>? video;

  OrderDetailsModel({
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
    this.date,
    this.time,
    this.address,
    this.techVisitStatus,
    this.warrantyClaimed,
    this.images,
    this.video,
  });

  OrderDetailsModel copyWith({
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
    DateTime? date,
    String? time,
    String? address,
    String? techVisitStatus,
    int? warrantyClaimed,
    List<String>? images,
    List<dynamic>? video,
  }) =>
      OrderDetailsModel(
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
        date: date ?? this.date,
        time: time ?? this.time,
        address: address ?? this.address,
        techVisitStatus: techVisitStatus ?? this.techVisitStatus,
        warrantyClaimed: warrantyClaimed ?? this.warrantyClaimed,
        images: images ?? this.images,
        video: video ?? this.video,
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
        'date': date?.toIso8601String(),
        'time': time,
        'address': address,
        'techVisitStatus': techVisitStatus,
        'warrantyClaimed': warrantyClaimed,
        'images': images,
        'video': video,
      };

  //from json
  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
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
      date: DateTime.parse(json['date']),
      time: json['time'] as String?,
      address: json['address'] as String?,
      techVisitStatus: json['techVisitStatus'] as String?,
      warrantyClaimed: json['warrantyClaimed'] as int?,
      images: json['images']?.cast<String>(),
      video: json['video'] as List<dynamic>?,
    );
  }
}
