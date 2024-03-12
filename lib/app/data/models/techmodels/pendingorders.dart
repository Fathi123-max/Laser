class PendingOrders {
  final int? orderId;
  final String? deviceTypeImage;
  final String? deviceName;
  final List<Service>? services;
  final int? totalPrice;
  final String? paymentType;
  final String? address;
  final DateTime? date;
  final String? time;
  final int? isPaid;

  PendingOrders({
    this.orderId,
    this.deviceTypeImage,
    this.deviceName,
    this.services,
    this.totalPrice,
    this.paymentType,
    this.address,
    this.date,
    this.time,
    this.isPaid,
  });

  factory PendingOrders.fromJson(Map<String, dynamic> json) => PendingOrders(
        orderId: json['orderId'],
        deviceTypeImage: json['deviceTypeImage'],
        deviceName: json['deviceName'],
        services: List<Service>.from(
            json['services'].map((x) => Service.fromJson(x))),
        totalPrice: json['totalPrice'],
        paymentType: json['paymentType'],
        address: json['address'],
        date: DateTime.parse(json['date']),
        time: json['time'],
        isPaid: json['isPaid'],
      );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'deviceTypeImage': deviceTypeImage,
        'deviceName': deviceName,
        'services': List<dynamic>.from(services!.map((x) => x.toJson())),
        'totalPrice': totalPrice,
        'paymentType': paymentType,
        'address': address,
        'date': date!.toIso8601String(),
        'time': time,
        'isPaid': isPaid,
      };

  PendingOrders copyWith({
    int? orderId,
    String? deviceTypeImage,
    String? deviceName,
    List<Service>? services,
    int? totalPrice,
    String? paymentType,
    String? address,
    DateTime? date,
    String? time,
    int? isPaid,
  }) =>
      PendingOrders(
        orderId: orderId ?? this.orderId,
        deviceTypeImage: deviceTypeImage ?? this.deviceTypeImage,
        deviceName: deviceName ?? this.deviceName,
        services: services ?? this.services,
        totalPrice: totalPrice ?? this.totalPrice,
        paymentType: paymentType ?? this.paymentType,
        address: address ?? this.address,
        date: date ?? this.date,
        time: time ?? this.time,
        isPaid: isPaid ?? this.isPaid,
      );
}

class Service {
  final int? serviceId;
  final String? serviceName;

  Service({
    this.serviceId,
    this.serviceName,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
      );

  Map<String, dynamic> toJson() => {
        'serviceId': serviceId,
        'serviceName': serviceName,
      };

  Service copyWith({
    int? serviceId,
    String? serviceName,
  }) =>
      Service(
        serviceId: serviceId ?? this.serviceId,
        serviceName: serviceName ?? this.serviceName,
      );
}
