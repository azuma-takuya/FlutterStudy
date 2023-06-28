import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_manager.dart';

class NewsFavoriteScreen extends StatelessWidget {
  const NewsFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesManager = Provider.of<FavoriteManager>(context);
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
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                favoritesManager.removeFavorite(news);
              },
            ),
          );
        },
      ),
    );
  }
}
