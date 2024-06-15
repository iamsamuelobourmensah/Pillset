// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VitalsHiveAdapter extends TypeAdapter<VitalsHive> {
  @override
  final int typeId = 0;

  @override
  VitalsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VitalsHive(
      temperature: fields[0] as String?,
      saturation: fields[1] as String?,
      lastUpdated: fields[2] as DateTime?,
      pressure: fields[3] as String?,
      heartRate: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VitalsHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.temperature)
      ..writeByte(1)
      ..write(obj.saturation)
      ..writeByte(2)
      ..write(obj.lastUpdated)
      ..writeByte(3)
      ..write(obj.pressure)
      ..writeByte(4)
      ..write(obj.heartRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VitalsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
