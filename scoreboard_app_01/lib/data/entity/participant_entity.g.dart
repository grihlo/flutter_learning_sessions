// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParticipantEntityAdapter extends TypeAdapter<ParticipantEntity> {
  @override
  final typeId = 0;

  @override
  ParticipantEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParticipantEntity(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ParticipantEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.score);
  }
}
