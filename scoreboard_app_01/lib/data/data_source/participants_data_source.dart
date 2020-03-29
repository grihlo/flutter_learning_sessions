import 'package:hive/hive.dart';
import 'package:scoreboardapp/data/entity/participant_entity.dart';

abstract class ParticipantsDataSource {
  List<ParticipantEntity> getParticipants();

  void createParticipant(ParticipantEntity participant);

  void updateParticipant(ParticipantEntity participant);

  void deleteParticipant(ParticipantEntity participant);
}

class ParticipantsDataSourceImpl implements ParticipantsDataSource {
  ParticipantsDataSourceImpl(this.box);

  final box;

  @override
  List<ParticipantEntity> getParticipants() {
    return box.values.toList().cast<ParticipantEntity>();
  }

  @override
  void createParticipant(ParticipantEntity participant) {
    box.put(participant.name, participant);
  }

  @override
  void deleteParticipant(ParticipantEntity participant) {
    box.delete(participant.name);
  }

  @override
  void updateParticipant(ParticipantEntity participant) {
    if (box.get(participant.name) != null) {
      box.delete(participant.name);
    }
    box.put(participant.name, participant);
  }
}
