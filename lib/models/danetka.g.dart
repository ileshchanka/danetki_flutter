// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'danetka.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DanetkaAdapter extends TypeAdapter<Danetka> {
  @override
  final int typeId = 1;

  @override
  Danetka read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Danetka(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Danetka obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DanetkaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
