import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All about buttons 📱',
      theme: ThemeData(
//        primaryColor: Colors.purple,
//        accentColor: Colors.red,
//        primarySwatch: Colors.orange,
//        buttonColor: Colors.green,
//        buttonTheme: ButtonThemeData(
//          buttonColor: Colors.green,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(100),
//          ),
//          textTheme: ButtonTextTheme.normal,
//          minWidth: 200.0,
//        ),
      ),
      home: PageView(
        children: <Widget>[
          MaterialButtonsBasicsPage(title: 'Material buttons'),
          MaterialButtonsExtendedPage(title: 'Material button drop down'),
          MaterialButtonsAdvancedPage(title: 'Material buttons core'),
          CupertinoButtonsBasicsPage(title: "Cupertino buttons"),
          FlutterButtonsCorePage(title: "Flutter buttons core"),
          CustomButtonsPlaygroundPage(title: "Custom buttons playground"),
          AnimatedButtonsPlaygroundPage(title: "Animated buttons playground"),
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
  _MaterialButtonsExtendedPageState createState() =>
      _MaterialButtonsExtendedPageState();
}

class _MaterialButtonsExtendedPageState
    extends State<MaterialButtonsExtendedPage> {
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
            // LOOK HERE! -> Semantics
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

class CupertinoButtonsBasicsPage extends StatelessWidget {
  CupertinoButtonsBasicsPage({Key key, this.title}) : super(key: key);

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
            CupertinoButton(
              onPressed: () {},
              child: Text("CupertinoButton"),
            ),
            CupertinoButton.filled(
              onPressed: () {},
              child: Text("CupertinoButton"),
            ),
          ],
        ),
      ),
    );
  }
}

class FlutterButtonsCorePage extends StatelessWidget {
  FlutterButtonsCorePage({Key key, this.title}) : super(key: key);

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
            GestureDetector(
              onTap: () => print("Tapped on GestureDetector"),
              child: Text("GestureDetector"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonsPlaygroundPage extends StatelessWidget {
  CustomButtonsPlaygroundPage({Key key, this.title}) : super(key: key);

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
            GestureDetector(
              onTap: () => print("Tapped on GestureDetector"),
              child: Text("DYI"),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButtonsPlaygroundPage extends StatelessWidget {
  AnimatedButtonsPlaygroundPage({Key key, this.title}) : super(key: key);

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
            RaisedButton(
              onPressed: () {},
              child: Text("TODO"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'TODO',
        child: Icon(Icons.check),
      ),
    );
  }
}
