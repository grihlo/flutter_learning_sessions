import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:scoreboardapp/data/entity/participant_entity.dart';
import 'package:scoreboardapp/di/participant_providers.dart';
import 'package:scoreboardapp/ui/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ParticipantEntityAdapter());
  await Hive.openBox('participants');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scoreboard',
      theme: ThemeData(
        primaryColor: Color(0xff4A49CB),
        accentColor: Color(0xff9D8DFF),
      ),
      home: MultiProvider(
        providers: participantProviders,
        child: MyHomePage(),
      ),
    );
  }
}
