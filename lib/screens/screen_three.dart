import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  // Descripciones iniciales para los dos contenedores
  final List<String> descriptions = [
    "Descripción inicial del Anotacion 1.",
    "Descripción inicial del Anotacion 2.",
  ];

  // Método para mostrar un cuadro de diálogo y permitir al usuario editar
  void _editDescription(BuildContext context, int index) {
    TextEditingController controller = TextEditingController(text: descriptions[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar descripción del Contenedor ${index + 1}"),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Escribe la nueva descripción aquí...",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                String newDescription = controller.text;
                if (newDescription.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("La descripción no puede estar vacía")),
                  );
                } else {
                  setState(() {
                    descriptions[index] = newDescription; // Actualiza la descripción
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Descripción del Anotacion ${index + 1} actualizada.")),
                  );
                }
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anotaciones")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Contenedor 1
          _buildContainer(
            title: "Anotacion #1",
            description: descriptions[0],
            onEdit: () => _editDescription(context, 0),
            color: Colors.blueAccent,
          ),
          // Contenedor 2
          _buildContainer(
            title: "Anotacion #2",
            description: descriptions[1],
            onEdit: () => _editDescription(context, 1),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  // Método para construir cada contenedor
  Widget _buildContainer({
    required String title,
    required String description,
    required VoidCallback onEdit,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onEdit, // Llama al método para editar
            child: const Text("Editar Descripción"),
          ),
        ],
      ),
    );
  }
}
