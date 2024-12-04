import 'package:flutter/material.dart';
import 'favorites_screen.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  // Lista de rutas locales para las imágenes
  final List<String> localImagePaths = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
    "assets/images/image6.jpg",
  ];

  final Set<int> favoriteIndices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recetas que he hecho"),
        backgroundColor: const Color.fromARGB(255, 210, 81, 22),
      ),
      body: localImagePaths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: localImagePaths.length,
              itemBuilder: (context, index) {
                final isFavorite = favoriteIndices.contains(index);
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        localImagePaths[index],
                        fit: BoxFit.cover, // Ajusta y recorta la imagen
                        width: 170, // Redimensiona el ancho
                        height: 150, // Redimensiona la altura
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isFavorite) {
                              favoriteIndices.remove(index);
                            } else {
                              favoriteIndices.add(index);
                            }
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(
                favorites: favoriteIndices
                    .map((index) => localImagePaths[index])
                    .toList(),
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 233, 21, 169),
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
