import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
  ];

  ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Ítems")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index]),
              onTap: () {
                // Acción al seleccionar un item (puedes agregar detalles si lo deseas)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Seleccionaste ${items[index]}')));
              },
            ),
          );
        },
      ),
    );
  }
}
