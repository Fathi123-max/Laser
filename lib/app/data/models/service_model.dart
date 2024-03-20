import 'package:hive/hive.dart';

part 'service_model.g.dart';

@HiveType(typeId: 8)
class ServiceModel extends HiveObject {
  @HiveField(1)
  final String? categoryName;
  @HiveField(2)
  final String? minPrice;
  @HiveField(3)
  final String? maxPrice;
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
    String? minPrice,
    String? maxPrice,
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
        "category_name": categoryName,
        "min_price": minPrice,
        "max_price": maxPrice,
        "service_id": serviceId,
      };

  //from json

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        categoryName: json["category_name"],
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        serviceId: json["service_id"],
      );
}
