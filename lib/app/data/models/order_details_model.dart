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
  final int? isPaid;
  @HiveField(16)
  final int? warrantyClaimed;
  @HiveField(17)
  final int? orderCode;
  @HiveField(18)
  final List<dynamic>? images;
  @HiveField(19)
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
    this.isPaid,
    this.warrantyClaimed,
    this.orderCode,
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
    int? isPaid,
    int? warrantyClaimed,
    int? orderCode,
    List<dynamic>? images,
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
        isPaid: isPaid ?? this.isPaid,
        warrantyClaimed: warrantyClaimed ?? this.warrantyClaimed,
        orderCode: orderCode ?? this.orderCode,
        images: images ?? this.images,
        video: video ?? this.video,
      );

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
        'isPaid': isPaid,
        'warrantyClaimed': warrantyClaimed,
        'orderCode': orderCode,
        'images': images,
        'video': video,
      };

  OrderDetailsModel.fromJson(Map<String, dynamic> json)
      : orderId = json['orderId'],
        deviceTypeImage = json['deviceTypeImage'],
        deviceName = json['deviceName'],
        services = json['services'],
        totalPrice = json['totalPrice'],
        currentStatusId = json['currentStatusId'],
        currentStatusName = json['currentStatusName'],
        currentStatusColor = json['currentStatusColor'],
        nextStatusName = json['nextStatusName'],
        paymentType = json['paymentType'],
        date = DateTime.parse(json['date']),
        time = json['time'],
        address = json['address'],
        techVisitStatus = json['techVisitStatus'],
        isPaid = json['isPaid'],
        warrantyClaimed = json['warrantyClaimed'],
        orderCode = json['orderCode'],
        images = json['images'],
        video = json['video'];
}
