import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: Participants(
        participants: [
          Participant("Grisha", 20),
          Participant("Oleg", 13),
          Participant("Vasja", 17),
          Participant("Vladimir", 2),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class Participant {
  Participant(this.name, this.score);

  String name;
  int score;
}

class Participants extends InheritedWidget {
  Participants({this.participants, Widget child}) : super(child: child);

  final List<Participant> participants;

  @override
  bool updateShouldNotify(Participants oldWidget) =>
      oldWidget.participants != participants;

  static Participants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: Participants);
}

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

class ScoreboardPage extends StatefulWidget {
  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  void _incrementScore(int index) {
    setState(() {
      Participants.of(context).participants[index].score++;
    });
  }

  void _decrementScore(int index) {
    setState(() {
      Participants.of(context).participants[index].score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Participant> participants =
        Participants.of(context).participants;
    participants.sort((a, b) => b.score.compareTo(a.score));
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      backgroundColor: Color(0xffFAFAFA),
      body: ListView.builder(
        itemCount: participants.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: <Widget>[
                if (index == 0)
                  Image(
                    image: AssetImage('assets/medal_first.png'),
                    width: 50,
                  )
                else if (index == 1)
                  Image(
                    image: AssetImage('assets/medal_second.png'),
                    width: 50,
                  )
                else if (index == 2)
                    Image(
                      image: AssetImage('assets/medal_third.png'),
                      width: 50,
                    )
                  else
                    SizedBox(
                      width: 50,
                    ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${participants[index].name}",
                  style: Theme.of(context).textTheme.title,
                ),
                Spacer(),
                Text(
                  "${participants[index].score}",
                  style: Theme.of(context).textTheme.title,
                ),
                MaterialButton(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  minWidth: 30.0,
                  shape: CircleBorder(),
                  color: Color(0xff9D8DFF),
                  onPressed: () => _decrementScore(index),
                ),
                MaterialButton(
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  ),
                  minWidth: 30.0,
                  shape: CircleBorder(),
                  color: Color(0xffFF7979),
                  onPressed: () => _incrementScore(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ParticipantsPage extends StatefulWidget {
  ParticipantsPage({Key key}) : super(key: key);

  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  final controller = TextEditingController();

  void _addParticipant(String name) {
    setState(() {
      Participants.of(context).participants.add(Participant(name, 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Participant> participants =
        Participants.of(context).participants;
    return Container(
      color: Theme.of(context).primaryColor,
      // Workaround to show floating action button on iOS (tab bar issue)
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Participants"),
          ),
          body: ListView.builder(
            itemCount: participants.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${participants[index].name}",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit),
                      color: Color(0xff9D8DFF),
                      onPressed: () async {
                        final result = await Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => ParticipantDetailPage(
                              name: participants[index].name,
                              score: participants[index].score,
                            ),
                          ),
                        );
                        if (result is bool && !result) {
                          participants.removeAt(index);
                        } else if (result is Participant) {
                          participants[index] = result;
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addParticipantDialog(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _addParticipantDialog() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      child: SimpleDialog(
        title: Text("Please enter name"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controller,
                  decoration: InputDecoration(labelText: "Name"),
                  autofocus: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        controller.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () {
                        _addParticipant(controller.text);
                        controller.clear();
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParticipantDetailPage extends StatefulWidget {
  ParticipantDetailPage({
    Key key,
    @required this.name,
    @required this.score,
  }) : super(key: key) {
    nameController.text = name;
    scoreController.text = score.toString();
  }

  final String name;
  final int score;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  @override
  _ParticipantDetailPageState createState() => _ParticipantDetailPageState();
}

class _ParticipantDetailPageState extends State<ParticipantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Participant Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Name:"),
              controller: widget.nameController,
              autofocus: true,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Score:"),
              controller: widget.scoreController,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(
                        context,
                        Participant(widget.nameController.text,
                            int.parse(widget.scoreController.text)));
                    widget.nameController.clear();
                  },
                  child: Text(
                    "Save",
                  ),
                ),
                Spacer(),
                FlatButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context, false);
                    widget.nameController.clear();
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
