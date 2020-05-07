import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All about buttons 📱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        children: <Widget>[
          MaterialButtonsBasicsPage(title: 'Material buttons'),
          MaterialButtonsExtendedPage(title: 'Material button drop down',),
          MaterialButtonsAdvancedPage(title: 'Material buttons'),
        ],
      ),
    );
  }
}

class MaterialButtonsBasicsPage extends StatelessWidget {
  MaterialButtonsBasicsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("FlatButton"),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("RaisedButton"),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("OutlineButton"),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("wow!"),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class MaterialButtonsExtendedPage extends StatefulWidget {
  MaterialButtonsExtendedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MaterialButtonsExtendedPageState createState() => _MaterialButtonsExtendedPageState();
}

class _MaterialButtonsExtendedPageState extends State<MaterialButtonsExtendedPage> {
  String dropdownValue = 'DropdownButton1';
  String popMenuValue = 'PopupMenuButton1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['DropdownButton1', 'DropdownButton2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "PopupMenuButton1",
                  child: Text("PopupMenuButton1"),
                ),
                PopupMenuItem(
                  value: "PopupMenuButton2",
                  child: Text("PopupMenuButton2"),
                ),
              ],
              initialValue: popMenuValue,
              onSelected: (value) {
                print("value:$value");
              },
              icon: Icon(Icons.menu),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialButtonsAdvancedPage extends StatelessWidget {
  MaterialButtonsAdvancedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Semantics
            InkWell(
              onTap: () {},
              child: Text("InkWell"),
            ),
            InkResponse(
              onTap: () {},
              child: Text("InkResponse"),
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Text("RawMaterialButton"),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text("MaterialButton"),
            ),
          ],
        ),
      ),
    );
  }
}