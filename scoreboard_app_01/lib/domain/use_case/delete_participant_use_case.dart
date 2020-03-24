import 'package:scoreboardapp/data/repository/participants_repository_impl.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class DeleteParticipantUseCase {
  final repository = ParticipantsRepositoryImpl();

  void call(Participant participant) {
    return repository.deleteParticipant(participant);
  }
}