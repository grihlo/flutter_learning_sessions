import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboardapp/domain/entity/participant.dart';
import 'package:scoreboardapp/ui/page/participant_detail_page.dart';
import 'package:scoreboardapp/ui/view_model/participants.dart';

class ParticipantsPage extends StatefulWidget {
  ParticipantsPage({Key key}) : super(key: key);

  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<Participants>(
        builder: (BuildContext context, Participants value, Widget child) {
          return Container(
            color: Theme.of(context).primaryColor,
            // Workaround to show floating action button on iOS (tab bar issue)
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Participants"),
                ),
                body: ListView.builder(
                  itemCount: value.participants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${value.participants[index].name}",
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
                                    name: value.participants[index].name,
                                    score: value.participants[index].score,
                                  ),
                                ),
                              );
                              if (result is bool && !result) {
                                value.deleteAt(index);
                              } else if (result is Participant) {
                                value.update(index, result);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => _addParticipantDialog(value),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ),
            ),
          );
        }
    );
  }

  Future<dynamic> _addParticipantDialog(Participants value) {
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
                        value.create(Participant(controller.text, 0));
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
