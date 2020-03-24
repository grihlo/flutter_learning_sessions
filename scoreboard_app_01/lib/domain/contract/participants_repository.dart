import 'package:scoreboardapp/domain/entity/participant.dart';

abstract class ParticipantsRepository {
  List<Participant> getParticipants();

  void createParticipant(Participant participant);

  void updateParticipant(Participant participant);

  void deleteParticipant(Participant participant);
}