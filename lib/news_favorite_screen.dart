import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FavoritesManager.dart';

class NewsFavoritesScreen extends StatelessWidget {
  const NewsFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesManager = Provider.of<FavoritesManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoritesManager.favorites!.length,
        itemBuilder: (context, index) {
          final news = favoritesManager.favorites![index];
          return ListTile(
            title: Text(news.title ?? 'No title'),
            subtitle: Text(news.url ?? 'No URL'),
          );
        },
      ),
    );
  }
}
