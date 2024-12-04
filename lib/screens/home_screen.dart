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
  static final List<Widget> _widgetOptions = <Widget>[
    const ScreenOne(),
    ScreenTwo(),
    const ScreenThree(),
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
        title: const Text("Cocinando contigo ♡"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Galería',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Descripción',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
