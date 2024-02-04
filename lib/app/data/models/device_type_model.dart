import 'package:hive/hive.dart';

part 'device_type_model.g.dart';

@HiveType(typeId: 5)
class DeviceType extends HiveObject {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? image;

  DeviceType({
    this.id,
    this.name,
    this.image,
  });

  DeviceType copyWith({
    int? id,
    String? name,
    String? image,
  }) =>
      DeviceType(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  @override
  String toString() => 'DeviceType(id: $id, name: $name, image: $image)';

//from json
  factory DeviceType.fromJson(Map<String, dynamic> json) {
    return DeviceType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
