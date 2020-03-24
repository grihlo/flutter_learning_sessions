import 'package:hive/hive.dart';

part 'participant_entity.g.dart';

@HiveType(typeId: 0)
class ParticipantEntity extends HiveObject {
  ParticipantEntity(this.name, this.score);

  @HiveField(0)
  String name;

  @HiveField(1)
  int score;
}
