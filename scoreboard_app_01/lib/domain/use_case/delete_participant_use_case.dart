import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/domain/repository/participants_repository.dart';

class DeleteParticipantUseCase {
  DeleteParticipantUseCase(this.repository);

  final ParticipantsRepository repository;

  void call(Participant participant) {
    return repository.deleteParticipant(participant);
  }
}