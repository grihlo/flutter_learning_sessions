import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboardapp/ui/page/home_page.dart';
import 'package:scoreboardapp/ui/view_model/participants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scoreboard',
      theme: ThemeData(
        primaryColor: Color(0xff4A49CB),
        accentColor: Color(0xff9D8DFF),
      ),
      home: ChangeNotifierProvider(
        create: (context) => Participants(),
        child: MyHomePage(),
      ),
    );
  }
}
