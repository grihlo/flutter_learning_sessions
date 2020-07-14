import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fun with transitions 📱',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.orange,
        primarySwatch: Colors.teal,
//        pageTransitionsTheme: PageTransitionsTheme(
//          builders: {
//            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
//            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(), //FadeTransitionsBuilder()
//          },
//        ),
      ),
      home: PageView(
        children: <Widget>[
          NavigationBasicsPage(title: 'Navigation basics'),
          PageTransitionPage(title: 'Page transitions'),
          HeroTransitionPage(title: 'Hero transition'),
        ],
      ),
    );
  }
}

class NavigationBasicsPage extends StatelessWidget {
  NavigationBasicsPage({Key key, this.title}) : super(key: key);

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
            Text("First Route"),
            RaisedButton(
              child: Text("Go!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class PageTransitionPage extends StatelessWidget {
  PageTransitionPage({Key key, this.title}) : super(key: key);

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
            Text("First Route"),
            RaisedButton(
              child: Text("Go cupertion style!"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SecondRoute(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go cupertion full screen dialog!"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => SecondRoute(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go material full screen dialog!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => SecondRoute(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go custom fade style!"),
              onPressed: () {
                Navigator.push(
                  context,
                  FadeRouteBuilder(
                    page: SecondRoute(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}

class FadeTransitionsBuilder<T> extends PageTransitionsBuilder {
  FadeTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class HeroTransitionPage extends StatelessWidget {
  HeroTransitionPage({Key key, this.title}) : super(key: key);

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
            Text("First Route"),
            Hero(
              tag: "coldHeroTag",
              child: Icon(
                Icons.ac_unit,
                size: 100.0,
              ),
            ),
            RaisedButton(
              child: Text("Go cold!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondHeroRoute(),
                  ),
                );
              },
            ),
            Hero(
              tag: "zapHeroTag",
              child: Container(
                color: Colors.deepPurpleAccent,
                height: 120.0,
                width: 120.0,
                child: Icon(
                  Icons.flash_on,
                  size: 100.0,
                ),
              ),
            ),
            RaisedButton(
              child: Text("Go zap!"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdHeroRoute(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondHeroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: "coldHeroTag",
              child: Icon(
                Icons.ac_unit,
                size: 100.0,
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go cold!'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdHeroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Hero(
        tag: "zapHeroTag",
        child: Container(
          color: Colors.deepPurpleAccent,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Icon(
            Icons.flash_on,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
