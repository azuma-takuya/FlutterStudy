import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FavoritesManager.dart';
import 'api/news_api.dart';
import 'model/news.dart';
import 'model/news_result.dart';
import 'news_favorite_screen.dart';


class NewsApiScreen extends StatefulWidget {
  const NewsApiScreen({super.key});

  @override
  State<NewsApiScreen> createState() => NewsApiState();
}

class NewsApiState extends State<NewsApiScreen> {
  late NewsApi newsApi;
  NewsResult? newsList;
  List<News>? favorites = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    newsApi = NewsApi(dio);
    fetchNews();
    context.read<FavoritesManager>().readFavorites();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   context.read<FavoritesManager>().readFavorites();
  // }

  Future<void> fetchNews() async {
    try {
      final response =
      await newsApi.getNews('1a1f54dd5dfd4f4492bfc3d8bd0e5a58');
      setState(() {
        newsList = response;
      });
    } catch (e) {
      print('Failed to fetch news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoritesManager = Provider.of<FavoritesManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News API Fetch'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchNews,
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                const NewsFavoritesScreen(),),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: newsList?.articles?.length,
        itemBuilder: (context, index) {
          final news = newsList?.articles![index];
          return ListTile(
            title: Text(news?.title ?? 'No title'),
            subtitle: Text(news?.url ?? 'No URL'),
            trailing: IconButton(
              icon: favoritesManager.isFavorite(news)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () => favoritesManager.toggleFavorite(news!),
            ),
          );
        },
      ),
    );
  }
}
