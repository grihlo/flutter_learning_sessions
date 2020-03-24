import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:scoreboardapp/data/repository/participants_repository_impl.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/domain/use_case/create_participant_use_case.dart';
import 'package:scoreboardapp/domain/use_case/delete_participant_use_case.dart';
import 'package:scoreboardapp/domain/use_case/get_participants_use_case.dart';
import 'package:scoreboardapp/domain/use_case/update_participant_use_case.dart';

class ParticipantsViewModel extends ChangeNotifier {
  final CreateParticipantUseCase _createParticipantUseCase = CreateParticipantUseCase();
  final DeleteParticipantUseCase _deleteParticipantUseCase = DeleteParticipantUseCase();
  final UpdateParticipantUseCase _updateParticipantUseCase = UpdateParticipantUseCase();
  final GetParticipantsUseCase _getParticipantsUseCase = GetParticipantsUseCase();

  // Handle duplicates

  UnmodifiableListView<Participant> get participants =>
      UnmodifiableListView(_getParticipantsUseCase());

  void create(Participant participant) {
    _createParticipantUseCase(participant);
    notifyListeners();
  }

  void update(Participant participant) {
    _updateParticipantUseCase(participant);
    notifyListeners();
  }

  void delete(Participant participant) {
    _deleteParticipantUseCase(participant);
    notifyListeners();
  }

  void incrementScore(Participant participant) {
    participant.score++;
    _updateParticipantUseCase(participant);
    notifyListeners();
  }

  void decrementScore(Participant participant) {
    participant.score--;
    _updateParticipantUseCase(participant);
    notifyListeners();
  }
}
