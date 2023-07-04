import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'favorite_manager.dart';

class NewsFavoriteScreen extends StatefulWidget {
  const NewsFavoriteScreen({required this.favoriteManager, super.key});
  final FavoriteManager favoriteManager;

  @override
  NewsFavoriteScreenState createState() => NewsFavoriteScreenState();
}

class NewsFavoriteScreenState extends State<NewsFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: widget.favoriteManager.favorites!.length,
        itemBuilder: (context, index) {
          final news = widget.favoriteManager.favorites![index];
          return ListTile(
            title: Text(news.title ?? 'No title'),
            subtitle: Text(news.url ?? 'No URL'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.favoriteManager.removeFavorite(news);
                setState(() {});  // UIを更新する
              },
            ),
            onTap: () async {
              final url = news.url;
              if(url != null) {
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  const Text('URLが取得できません。');
                }
              }
            },
          );
        },
      ),
    );
  }
}
