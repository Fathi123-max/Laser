// To parse this JSON data, do
//
//     final respmodel = respmodelFromJson(jsonString);

import 'dart:convert';

Respmodel respmodelFromJson(String str) => Respmodel.fromJson(json.decode(str));

String respmodelToJson(Respmodel data) => json.encode(data.toJson());

class Respmodel {
  int? orderId;
  DateTime? date;
  String? time;
  List<ServiceDetail>? serviceDetails;
  int? discount;
  int? finalPrice;

  Respmodel({
    this.orderId,
    this.date,
    this.time,
    this.serviceDetails,
    this.discount,
    this.finalPrice,
  });

  factory Respmodel.fromJson(Map<String, dynamic> json) => Respmodel(
        orderId: json["orderId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        serviceDetails: json["serviceDetails"] == null
            ? []
            : List<ServiceDetail>.from(
                json["serviceDetails"]!.map((x) => ServiceDetail.fromJson(x))),
        discount: json["discount"],
        finalPrice: json["finalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "serviceDetails": serviceDetails == null
            ? []
            : List<dynamic>.from(serviceDetails!.map((x) => x.toJson())),
        "discount": discount,
        "finalPrice": finalPrice,
      };
}

class ServiceDetail {
  String? name;
  int? price;

  ServiceDetail({
    this.name,
    this.price,
  });

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
