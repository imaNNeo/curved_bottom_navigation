import 'package:curved_bottom_navigation/curved_bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Curved Bottom Navigation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int navPos = 0;

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
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedBottomNavigation(
        selected: navPos,
        onItemClick: (i) {
          setState(() {
            navPos = i;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.home, color: Colors.white,),
        ],
      )
    );
  }
}
