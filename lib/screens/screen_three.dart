import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pantalla 3")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);  // Volver a la pantalla anterior
          },
          child: const Text("Volver a Pantalla 2"),
        ),
      ),
    );
  }
}
