import 'package:flutter/material.dart';
import 'screen_one.dart';  // Pantalla 1
import 'screen_two.dart';  // Pantalla 2
import 'screen_three.dart';  // Pantalla 3

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List de pantallas que se muestran según el índice seleccionado
  static const List<Widget> _widgetOptions = <Widget>[
    ScreenOne(),
    ScreenTwo(),
    ScreenThree(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla Principal"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pantalla 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pantalla 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pantalla 3',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
