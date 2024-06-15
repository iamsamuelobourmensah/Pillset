import 'package:hive/hive.dart';


part 'vital_hive_model.g.dart';

@HiveType(typeId: 0)
class VitalsHive {
  @HiveField(0)
  final String? temperature;
  @HiveField(1)
  final String? saturation;
  @HiveField(2)
  final DateTime? lastUpdated;
  @HiveField(3)
  final String? pressure;
  @HiveField(4)
  final String? heartRate;

  VitalsHive({required this.temperature, required this.saturation, required this.lastUpdated, required this.pressure, required this.heartRate});

}

