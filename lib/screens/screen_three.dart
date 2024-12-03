import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Descripción")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Primer contenedor
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Column(
              children: [
                const Text(
                  "Contenedor 1",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 1 presionado en Contenedor 1"),
                      child: const Text("Botón 1"),
                    ),
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 2 presionado en Contenedor 1"),
                      child: const Text("Botón 2"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Segundo contenedor
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: Column(
              children: [
                const Text(
                  "Contenedor 2",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 1 presionado en Contenedor 2"),
                      child: const Text("Botón 1"),
                    ),
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 2 presionado en Contenedor 2"),
                      child: const Text("Botón 2"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tercer contenedor
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange,
            ),
            child: Column(
              children: [
                const Text(
                  "Contenedor 3",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 1 presionado en Contenedor 3"),
                      child: const Text("Botón 1"),
                    ),
                    ElevatedButton(
                      onPressed: () => _showMessage(context, "Botón 2 presionado en Contenedor 3"),
                      child: const Text("Botón 2"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
