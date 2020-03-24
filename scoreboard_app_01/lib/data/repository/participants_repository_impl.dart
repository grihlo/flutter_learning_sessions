import 'package:scoreboardapp/data/data_source/participants_data_source.dart';
import 'package:scoreboardapp/data/entity/participant_entity.dart';
import 'package:scoreboardapp/domain/contract/participants_repository.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class ParticipantsRepositoryImpl implements ParticipantsRepository {
  final dataSource = ParticipantsDataSourceImpl();

  @override
  void createParticipant(Participant participant) {
    dataSource.createParticipant(
        ParticipantEntity(participant.name, participant.score));
  }

  @override
  void deleteParticipant(Participant participant) {
    dataSource.deleteParticipant(
        ParticipantEntity(participant.name, participant.score));
  }

  @override
  List<Participant> getParticipants() {
    return dataSource.getParticipants().map(
            (entity) => Participant(entity.name, entity.score)).toList();
  }

  @override
  void updateParticipant(Participant participant) {
    dataSource.updateParticipant(
        ParticipantEntity(participant.name, participant.score));
  }
}
