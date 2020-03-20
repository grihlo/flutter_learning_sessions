import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/ui/view_model/participants.dart';

class ScoreboardPage extends StatefulWidget {
  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      backgroundColor: Color(0xffFAFAFA),
      body: Consumer<Participants>(
        builder: (BuildContext context, Participants value, Widget child) {
          final List<Participant> participants = List<Participant>.from(value.participants);
          participants.sort((a, b) => b.score.compareTo(a.score));
          return ListView.builder(
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
                      onPressed: () => value.decrementScore(participants[index]),
                    ),
                    MaterialButton(
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                      ),
                      minWidth: 30.0,
                      shape: CircleBorder(),
                      color: Color(0xffFF7979),
                      onPressed: () => value.incrementScore(participants[index]),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
