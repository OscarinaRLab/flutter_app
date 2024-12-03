import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'favorites_screen.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final List<String> initialImageUrls = [
    "https://via.placeholder.com/150/92c952",
    "https://via.placeholder.com/150/771796",
    "https://via.placeholder.com/150/24f355",
    "https://via.placeholder.com/150/d32776",
    "https://via.placeholder.com/150/f66b97",
    "https://via.placeholder.com/150/56a8c2",
  ];

  List<String> validImageUrls = [];
  final Set<int> favoriteIndices = {};

  @override
  void initState() {
    super.initState();
    validateImageUrls();
  }

  Future<void> validateImageUrls() async {
    List<String> validUrls = [];
    for (String url in initialImageUrls) {
      if (await isImageUrlValid(url)) {
        validUrls.add(url);
      }
    }

    if (mounted) {
      setState(() {
        validImageUrls = validUrls;
      });
    }
  }

  Future<bool> isImageUrlValid(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Imágenes"),
        backgroundColor: Colors.blueAccent,
      ),
      body: validImageUrls.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: validImageUrls.length,
              itemBuilder: (context, index) {
                final isFavorite = favoriteIndices.contains(index);
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        validImageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
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
                    .map((index) => validImageUrls[index])
                    .toList(),
              ),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
