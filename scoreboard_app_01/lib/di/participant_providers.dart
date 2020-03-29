import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scoreboardapp/data/data_source/participants_data_source.dart';
import 'package:scoreboardapp/data/repository_impl/participants_repository_impl.dart';
import 'package:scoreboardapp/domain/repository/participants_repository.dart';
import 'package:scoreboardapp/domain/use_case/create_participant_use_case.dart';
import 'package:scoreboardapp/domain/use_case/delete_participant_use_case.dart';
import 'package:scoreboardapp/domain/use_case/get_participants_use_case.dart';
import 'package:scoreboardapp/domain/use_case/update_participant_use_case.dart';
import 'package:scoreboardapp/ui/view_model/participants_view_model.dart';

List<SingleChildWidget> participantProviders = <SingleChildWidget>[
  Provider<ParticipantsDataSource>(
    create: (_) => ParticipantsDataSourceImpl(Hive.box("participants")),
  ),
  ProxyProvider<ParticipantsDataSource, ParticipantsRepository>(
      create: (_) => null,
      update: (_, ParticipantsDataSource participantsDataSource,
          ParticipantsRepository previous) {
        if (previous != null) {
          return previous;
        }
        return ParticipantsRepositoryImpl(participantsDataSource);
      }),
  ProxyProvider<ParticipantsRepository, CreateParticipantUseCase>(
      create: (_) => null,
      update: (_, ParticipantsRepository participantsRepository,
          CreateParticipantUseCase previous) {
        if (previous != null) {
          return previous;
        }
        return CreateParticipantUseCase(participantsRepository);
      }),
  ProxyProvider<ParticipantsRepository, DeleteParticipantUseCase>(
      create: (_) => null,
      update: (_, ParticipantsRepository participantsRepository,
          DeleteParticipantUseCase previous) {
        if (previous != null) {
          return previous;
        }
        return DeleteParticipantUseCase(participantsRepository);
      }),
  ProxyProvider<ParticipantsRepository, GetParticipantsUseCase>(
      create: (_) => null,
      update: (_, ParticipantsRepository participantsRepository,
          GetParticipantsUseCase previous) {
        if (previous != null) {
          return previous;
        }
        return GetParticipantsUseCase(participantsRepository);
      }),
  ProxyProvider<ParticipantsRepository, UpdateParticipantUseCase>(
      create: (_) => null,
      update: (_, ParticipantsRepository participantsRepository,
          UpdateParticipantUseCase previous) {
        if (previous != null) {
          return previous;
        }
        return UpdateParticipantUseCase(participantsRepository);
      }),
  ChangeNotifierProxyProvider4<
          CreateParticipantUseCase,
          DeleteParticipantUseCase,
          GetParticipantsUseCase,
          UpdateParticipantUseCase,
          ParticipantsViewModel>(
      create: (_) => null,
      update: (_,
          CreateParticipantUseCase createParticipantUseCase,
          DeleteParticipantUseCase deleteParticipantUseCase,
          GetParticipantsUseCase getParticipantsUseCase,
          UpdateParticipantUseCase updateParticipantUseCase,
          ParticipantsViewModel previous) {
        if (previous != null) {
          return previous;
        }
        return ParticipantsViewModel(
            createParticipantUseCase,
            deleteParticipantUseCase,
            getParticipantsUseCase,
            updateParticipantUseCase);
      }),
];
