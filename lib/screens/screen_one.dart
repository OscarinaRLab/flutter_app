  import 'package:flutter/material.dart';
import 'package:flutter_app_test_3/screens/screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 1")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenTwo()),  // Navegar a la pantalla 2
            );
          },
          child: const Text("Ir a Pantalla 2"),
        ),
      ),
    );
  }
}
