import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/screens/about.dart';
import 'package:nabadwip/screens/home.dart';
import 'package:nabadwip/screens/nearest.dart';
import 'package:nabadwip/screens/phone.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainHome(),
    Nearest(),
    Phone(),
    About(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      /*  bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: bodycolor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            label: 'Places',
            backgroundColor: bodycolor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_iphone),
            label: 'Phone',
            backgroundColor: bodycolor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: bodycolor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blue,
        backgroundColor: bodycolor,
        onTap: _onItemTapped,
        unselectedItemColor: blue,
      ),*/
    );
  }
}
