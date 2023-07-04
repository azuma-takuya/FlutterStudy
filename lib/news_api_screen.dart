import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api/news_api.dart';
import 'favorites_manager.dart';
import 'model/news.dart';
import 'model/news_result.dart';
import 'news_favorite_screen.dart';

final newsProvider = FutureProvider.autoDispose<NewsResult>((ref) async {
  final dio = Dio();
  final newsApi = NewsApi(dio);
  const newsApiKey = String.fromEnvironment('NEWS_API_KEY');
  final response = await newsApi.getNews(newsApiKey);
  return response;
});

final favoritesProvider = ChangeNotifierProvider((ref) => FavoritesManager());

class NewsApiScreen extends ConsumerWidget {
  const NewsApiScreen({super.key});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final newsList = watch(newsProvider);
    final favoritesManager = watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News API Fetch'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.refresh(newsProvider),
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              const NewsFavoritesScreen(),),
              );
            },
          ),
        ],
      ),
      body: newsList.when(
        data: (news) =>
            ListView.builder(
              itemCount: news.articles.length,
              itemBuilder: (context, index) {
                final newsItem = news.articles[index];
                return ListTile(
                  title: Text(newsItem.title ?? 'No title'),
                  subtitle: Text(newsItem.url ?? 'No URL'),
                  trailing: IconButton(
                    icon: favoritesManager.isFavorite(newsItem)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                    onPressed: () => favoritesManager.toggleFavorite(newsItem),
                  ),
                );
              },
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Failed to fetch news: $e')),
      ),
    );
  }
}

