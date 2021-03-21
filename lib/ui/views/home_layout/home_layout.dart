import 'package:beautystar_user_app/app/locator.dart';
import 'package:beautystar_user_app/services/local_database_service.dart';
import 'package:beautystar_user_app/ui/views/home/home_view.dart';
import 'package:beautystar_user_app/ui/views/login/login_view.dart';
import 'package:beautystar_user_app/ui/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var isLoggedIn = locator<LocalDatabaseService>().isLoggedIn();

  final tabs = <Widget>[
    HomeView(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    if(index == 2 && !isLoggedIn) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginView()
      ));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabs.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      )
    );
  }
}