import 'package:scoreboardapp/data/entity/participant_entity.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/domain/repository/participants_repository.dart';

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
    return dataSource
        .getParticipants()
        .map<Participant>((entity) => Participant(entity.name, entity.score))
        .toList();
  }

  @override
  void updateParticipant(Participant participant) {
    dataSource.updateParticipant(
        ParticipantEntity(participant.name, participant.score));
  }
}
