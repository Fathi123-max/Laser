class AcceptedOrder {
  final int? orderId;
  final String? deviceTypeImage;
  final String? deviceName;
  final List<Service>? services;
  final int? totalPrice;
  final String? paymentType;
  final String? address;
  final DateExpiry? dateExpiry;
  final DateTime? date;
  final String? time;
  final int? isPaid;
  final int? orderCode;
  final String? nextStatus;
  final String? nextRoute;
  final dynamic finishRoute;

  AcceptedOrder({
    this.orderId,
    this.deviceTypeImage,
    this.deviceName,
    this.services,
    this.totalPrice,
    this.paymentType,
    this.address,
    this.dateExpiry,
    this.date,
    this.time,
    this.isPaid,
    this.orderCode,
    this.nextStatus,
    this.nextRoute,
    this.finishRoute,
  });

  AcceptedOrder copyWith({
    int? orderId,
    String? deviceTypeImage,
    String? deviceName,
    List<Service>? services,
    int? totalPrice,
    String? paymentType,
    String? address,
    DateExpiry? dateExpiry,
    DateTime? date,
    String? time,
    int? isPaid,
    int? orderCode,
    String? nextStatus,
    String? nextRoute,
    dynamic finishRoute,
  }) =>
      AcceptedOrder(
        orderId: orderId ?? this.orderId,
        deviceTypeImage: deviceTypeImage ?? this.deviceTypeImage,
        deviceName: deviceName ?? this.deviceName,
        services: services ?? this.services,
        totalPrice: totalPrice ?? this.totalPrice,
        paymentType: paymentType ?? this.paymentType,
        address: address ?? this.address,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        date: date ?? this.date,
        time: time ?? this.time,
        isPaid: isPaid ?? this.isPaid,
        orderCode: orderCode ?? this.orderCode,
        nextStatus: nextStatus ?? this.nextStatus,
        nextRoute: nextRoute ?? this.nextRoute,
        finishRoute: finishRoute ?? this.finishRoute,
      );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'deviceTypeImage': deviceTypeImage,
        'deviceName': deviceName,
        'services': services?.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice,
        'paymentType': paymentType,
        'address': address,
        'dateExpiry': dateExpiry?.toJson(),
        'date': date?.toIso8601String(),
        'time': time,
        'isPaid': isPaid,
        'orderCode': orderCode,
        'nextStatus': nextStatus,
        'nextRoute': nextRoute,
        'finishRoute': finishRoute,
      };

  factory AcceptedOrder.fromJson(Map<String, dynamic> json) => AcceptedOrder(
        orderId: json['orderId'],
        deviceTypeImage: json['deviceTypeImage'],
        deviceName: json['deviceName'],
        services: List<Service>.from(
            json['services']?.map((x) => Service.fromJson(x))),
        totalPrice: json['totalPrice'],
        paymentType: json['paymentType'],
        address: json['address'],
        dateExpiry: json['dateExpiry'] != null
            ? DateExpiry.fromJson(json['dateExpiry'])
            : null,
        date: DateTime.parse(json['date']),
        time: json['time'],
        isPaid: json['isPaid'],
        orderCode: json['orderCode'],
        nextStatus: json['nextStatus'],
        nextRoute: json['nextRoute'],
        finishRoute: json['finishRoute'],
      );
}

class DateExpiry {
  final String? text;
  final String? color;

  DateExpiry({
    this.text,
    this.color,
  });

  DateExpiry copyWith({
    String? text,
    String? color,
  }) =>
      DateExpiry(
        text: text ?? this.text,
        color: color ?? this.color,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'color': color,
      };

  factory DateExpiry.fromJson(Map<String, dynamic> json) => DateExpiry(
        text: json['text'],
        color: json['color'],
      );
}

class Service {
  final int? serviceId;
  final String? serviceName;

  Service({
    this.serviceId,
    this.serviceName,
  });

  Service copyWith({
    int? serviceId,
    String? serviceName,
  }) =>
      Service(
        serviceId: serviceId ?? this.serviceId,
        serviceName: serviceName ?? this.serviceName,
      );

  Map<String, dynamic> toJson() => {
        'serviceId': serviceId,
        'serviceName': serviceName,
      };

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
      );
}
