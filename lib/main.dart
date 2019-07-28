import 'package:flutter/material.dart';
import 'package:londonair/src/screens/bookmarks_view.dart';
import 'package:londonair/src/screens/top_news.dart';
import 'package:londonair/src/services/service_locator.dart';

import 'src/services/location.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationScreen(),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedTab = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _TabOptions = <Widget>[
    TopNewsPage(),
    Text(
      'Sources',
      style: optionStyle,
    ),
    BookMarksView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to NewsMe'),
      ),
      body: Center(
        child: _TabOptions.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Top News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Sources'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('My News'),
          ),
        ],
        currentIndex: _selectedTab,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void getLocation() {
    Location location = Location();
    location.getCurrentLocation();
  }
}
