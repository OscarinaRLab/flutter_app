import 'package:flutter/material.dart';
import 'package:flutter_app_test_3/screens/screen_three.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 2")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenThree()),  // Navegar a la pantalla 3
            );
          },
          child: const Text("Ir a Pantalla 3"),
        ),
      ),
    );
  }
}
