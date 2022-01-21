import 'package:flutter/material.dart';
import 'package:s_demo/app_constants/sd_colors.dart';
import 'package:s_demo/screens/SDCartScreen.dart';
import 'package:s_demo/screens/SDHomeScreen.dart';
import 'package:s_demo/screens/SDMessageScreen.dart';
import 'package:s_demo/screens/SDNotifyScreen.dart';
import 'package:s_demo/screens/SDProfileScreen.dart';


class SDDashboardScreen extends StatefulWidget {
  static String tag ='/DashboardScreen';

  @override
  _SDDashboardScreenState createState() => _SDDashboardScreenState();
}

class _SDDashboardScreenState extends State<SDDashboardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    SDHomeScreen(),
    SDNotifyScreen(),
    SDCartScreen(),
    SDMessageScreen(),
    SDProfileScreen()
  ];


  Widget _bottomTab(){
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: SDColorPrimary,
      selectedLabelStyle: TextStyle(color: SDColorPrimary),
      unselectedItemColor: SDGreyColor,
      unselectedLabelStyle: TextStyle(color: SDGreyColor),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Discover')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Notify')),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Cart')),
        BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('Messages')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ]
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: Center(
        child: _pages.elementAt(_selectedIndex) ,
      ),
    ));
  }
}
