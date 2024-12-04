import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'title': 'Recetas 1', 'description': 'Descripción del Item 1'},
    {'title': 'Recetas 2', 'description': 'Descripción del Item 2'},
    {'title': 'Recetas 3', 'description': 'Descripción del Item 3'},
    {'title': 'Recetas 4', 'description': 'Descripción del Item 4'},
    {'title': 'Recetas 5', 'description': 'Descripción del Item 5'},
    {'title': 'Recetas 6', 'description': 'Descripción del Item 6'},
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
              title: Text(items[index]['title']!),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ScaleTransitionDialog(
                    title: items[index]['title']!,
                    description: items[index]['description']!,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ScaleTransitionDialog extends StatefulWidget {
  final String title;
  final String description;

  const ScaleTransitionDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<ScaleTransitionDialog> createState() => _ScaleTransitionDialogState();
}

class _ScaleTransitionDialogState extends State<ScaleTransitionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        title: Text(widget.title),
        content: Text(widget.description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}

