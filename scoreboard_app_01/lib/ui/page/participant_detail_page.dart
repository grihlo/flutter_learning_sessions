import 'package:flutter/material.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';

class ParticipantDetailPage extends StatefulWidget {
  ParticipantDetailPage({
    Key key,
    @required this.name,
    @required this.score,
  }) : super(key: key);

  final String name;
  final int score;

  @override
  _ParticipantDetailPageState createState() => _ParticipantDetailPageState();
}

class _ParticipantDetailPageState extends State<ParticipantDetailPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController scoreController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    scoreController.dispose();
  }

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
              autofocus: true,
              controller: nameController..text = widget.name,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Score:"),
              controller: scoreController..text = widget.score.toString(),
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
                        Participant(nameController.text,
                            int.parse(scoreController.text)));
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
                    Navigator.pop(context, widget.name);
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
