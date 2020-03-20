import 'package:flutter/material.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

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
