import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboardapp/ui/page/participants_page.dart';
import 'package:scoreboardapp/ui/page/scoreboard_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  void onTabTapped(int index) {
    setState(() => _tabIndex = index);
  }

  List<Widget> tabs = [
    ScoreboardPage(),
    ParticipantsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        body: tabs[_tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _tabIndex,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up), title: Text("Scoreboard")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text("Participants"))
            ]),
      );
    } else if (Platform.isIOS) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.up_arrow), title: Text("Scoreboard")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.group_solid),
                title: Text("Participants"))
          ]),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return ScoreboardPage();
                break;
              case 1:
                return ParticipantsPage();
                break;
              default:
                return ScoreboardPage();
                break;
            }
          });
    } else {
      throw Exception("Unsupported platform");
    }
  }
}
