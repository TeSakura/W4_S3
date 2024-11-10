import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FavoriteCardsList(),
    );
  }
}

// Parent widget to manage the list of favorite cards
class FavoriteCardsList extends StatelessWidget {
  const FavoriteCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Cards')),
      body: const Column(
        children: [
          FavoriteCard(title: "Title 1", description: "Description 1", isFavorite: true),
          FavoriteCard(title: "Title 2", description: "Description 2", isFavorite: false),
          FavoriteCard(title: "Title 3", description: "Description 3", isFavorite: true),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}
