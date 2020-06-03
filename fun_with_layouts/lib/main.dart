import 'dart:math' as math;

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
          AdaptiveLayoutPage(title: 'Adaptive layout playground'),
//          IntroWebPage(title: "Intro to Flutter web"),
//          ResponsiveWebPage(title: "Responsive Flutter web"),
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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Container(
        height: 200.0,
        width: 1000.0,
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Orientation"),
            Text("Screen size"),
            Text("Device type"),
          ],
        ),
      )),
    );
  }
}

class AnimatedButtonTaskPage extends StatefulWidget {
  AnimatedButtonTaskPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedButtonTaskPageState createState() => _AnimatedButtonTaskPageState();
}

class _AnimatedButtonTaskPageState extends State<AnimatedButtonTaskPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _rotationForward;
  Animation _rotationBack;
  Animation _capRotation;
  Animation _capPosition;
  Animation _scaleUp;
  Animation _scaleDown;
  Animation _position;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 1500), vsync: this)
          ..addListener(
            () {
              setState(
                () {},
              );
            },
          );
    _rotationForward = Tween(
      begin: 0.0,
      end: math.pi * -0.05,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _rotationBack = Tween(
      begin: math.pi * -0.05,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _scaleUp = Tween(
      begin: 1.0,
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          0.6,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _position = Tween(
      begin: 0.0,
      end: 50.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          0.9,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _capPosition = Tween(
      begin: 0.0,
      end: -30.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.7,
          0.9,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _controller.forward(),
          onDoubleTap: () => _controller.reverse(),
          child: ClipRect(
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              padding: EdgeInsets.all(16.0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..rotateZ(getRotationValue())
                  ..scale(_scaleUp.value)
                  ..translate(_position.value),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 30.0,
                        child: Transform(
                          alignment: FractionalOffset.center,
                          transform: Matrix4.identity()
                            ..translate(0.0, _capPosition.value),
                          child: Image.asset(
                            "assets/cap.png",
                            width: 100.0,
                          ),
                        )),
                    Positioned(
                        bottom: 0.0,
                        child: Image.asset(
                          "assets/bin.png",
                          width: 100.0,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getRotationValue() {
    if (_rotationForward.value != math.pi * -0.05) {
      return _rotationForward.value;
    } else {
      return _rotationBack.value;
    }
  }
}

class AdaptiveLayoutPage extends StatelessWidget {
  AdaptiveLayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text("TODO")),
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
      body: Center(child: Text("TODO")),
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
      body: Center(child: Text("TODO")),
    );
  }
}
