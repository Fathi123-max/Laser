import 'package:hive/hive.dart';

part 'device_model.g.dart';

@HiveType(typeId: 7)
class DeviceModel extends HiveObject {
  @HiveField(1)
  final int? id;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final List<dynamic>? colors;

  DeviceModel({
    this.id,
    this.name,
    this.colors,
  });

  DeviceModel copyWith({
    int? id,
    String? name,
    List<dynamic>? colors,
  }) =>
      DeviceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        colors: colors ?? this.colors,
      );

  //to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'colors': colors,
      };

  //from json
  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      colors: json['colors'] as List<dynamic>?,
    );
  }
}
