import 'package:hive/hive.dart';

part 'device_brand_model.g.dart';

@HiveType(typeId: 6)
class DeviceBrandModel extends HiveObject {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? image;

  DeviceBrandModel({
    this.id,
    this.name,
    this.image,
  });

  DeviceBrandModel copyWith({
    int? id,
    String? name,
    String? image,
  }) =>
      DeviceBrandModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  @override
  String toString() => 'DeviceBrandModel(id: $id, name: $name, image: $image)';

  //to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  //from json
  factory DeviceBrandModel.fromJson(Map<String, dynamic> json) {
    return DeviceBrandModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }
}
