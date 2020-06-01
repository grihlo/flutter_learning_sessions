import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun with layouts 📱',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: PageView(
        children: <Widget>[
          IntroLayoutsPage(title: 'Intro to layouts'),
          AnimatedButtonTaskPage(title: 'Animtead button task'),
          ResponsiveLayoutPage(title: 'Responsive layout'),
          IntroWebPage(title: "Intro to Flutter web"),
          ResponsiveWebPage(title: "Responsive Flutter web"),
        ],
      ),
    );
  }
}

class IntroLayoutsPage extends StatelessWidget {
  IntroLayoutsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("TODO")
      ),
    );
  }
}

class AnimatedButtonTaskPage extends StatelessWidget {
  AnimatedButtonTaskPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Text("TODO")
      ),
    );
  }
}

class ResponsiveLayoutPage extends StatelessWidget {
  ResponsiveLayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Text("TODO")
      ),
    );
  }
}

class IntroWebPage extends StatelessWidget {
  IntroWebPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Text("TODO")
      ),
    );
  }
}

class ResponsiveWebPage extends StatelessWidget {
  ResponsiveWebPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Text("TODO")
      ),
    );
  }
}
