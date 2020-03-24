import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scoreboardapp/data/repository/participants_repository_impl.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class ParticipantsViewModel extends ChangeNotifier {
  final repository = ParticipantsRepositoryImpl();

  // Handle duplicates

  UnmodifiableListView<Participant> get participants =>
      UnmodifiableListView(repository.getParticipants());

  void create(Participant participant) {
    repository.createParticipant(participant);
    notifyListeners();
  }

  void update(Participant participant) {
    repository.updateParticipant(participant);
    notifyListeners();
  }

  void delete(Participant participant) {
    repository.deleteParticipant(participant);
    notifyListeners();
  }

  void incrementScore(Participant participant) {
    participant.score++;
    repository.updateParticipant(participant);
    notifyListeners();
  }

  void decrementScore(Participant participant) {
    participant.score--;
    repository.updateParticipant(participant);
    notifyListeners();
  }
}
