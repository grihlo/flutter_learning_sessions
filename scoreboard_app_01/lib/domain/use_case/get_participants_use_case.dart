import 'package:scoreboardapp/data/repository/participants_repository_impl.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class GetParticipantsUseCase {
  final repository = ParticipantsRepositoryImpl();

  List<Participant> call() {
    return repository.getParticipants();
  }
}