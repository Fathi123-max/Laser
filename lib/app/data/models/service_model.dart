import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 1)
class ServiceModel extends HiveObject {
  @HiveField(1)
  final String? categoryName;
  @HiveField(2)
  final int? minPrice;
  @HiveField(3)
  final int? maxPrice;
  @HiveField(4)
  final int? serviceId;

  ServiceModel({
    this.categoryName,
    this.minPrice,
    this.maxPrice,
    this.serviceId,
  });

  ServiceModel copyWith({
    String? categoryName,
    int? minPrice,
    int? maxPrice,
    int? serviceId,
  }) =>
      ServiceModel(
        categoryName: categoryName ?? this.categoryName,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        serviceId: serviceId ?? this.serviceId,
      );

  //to json

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        "serviceId": serviceId,
      };

  //from json

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        categoryName: json["categoryName"],
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        serviceId: json["serviceId"],
      );
}
