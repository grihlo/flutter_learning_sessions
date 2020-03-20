import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class Participants extends ChangeNotifier {
  final List<Participant> _participants = [
    Participant("Grisha", 20),
    Participant("Oleg", 13),
    Participant("Vasja", 17),
    Participant("Vladimir", 2),
  ];

  // Handle duplicates

  UnmodifiableListView<Participant> get participants =>
      UnmodifiableListView(_participants);

  void create(Participant participant) {
    _participants.add(participant);
    notifyListeners();
  }

  void update(int index, Participant participant) {
    _participants[index] = participant;
    notifyListeners();
  }

  void deleteAt(int index) {
    _participants.removeAt(index);
    notifyListeners();
  }

  void incrementScore(Participant participant) {
    _participants.firstWhere((p) => p.name ==participant.name).score++;
    notifyListeners();
  }

  void decrementScore(Participant participant) {
    _participants.firstWhere((p) => p.name ==participant.name).score--;
    notifyListeners();
  }
}
