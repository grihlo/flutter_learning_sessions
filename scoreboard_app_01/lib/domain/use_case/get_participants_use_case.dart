import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/domain/repository/participants_repository.dart';

class GetParticipantsUseCase {
  GetParticipantsUseCase(this.repository);

  final ParticipantsRepository repository;

  List<Participant> call() {
    return repository.getParticipants();
  }
}