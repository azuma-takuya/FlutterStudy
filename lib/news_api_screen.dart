import 'package:countup/favorite_manager.dart';
import 'package:countup/news_favorite_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api/news_api.dart';
import 'model/news.dart';
import 'model/news_result.dart';


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
    context.read<FavoriteManager>().readFavorites();
  }

  Future<void> fetchNews() async {
    try {
      const newsApiKey = String.fromEnvironment('NEWS_API_KEY');
      final response =
      await newsApi.getNews(newsApiKey);
      setState(() {
        newsList = response;
      });
    } catch (e) {
      print('Failed to fetch news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteManager = Provider.of<FavoriteManager>(context);
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
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              const NewsFavoriteScreen(),),
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
              icon: favoriteManager.isFavorite(news)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () => favoriteManager.toggleFavorite(news!),
            ),
          );
        },
      ),
    );
  }
}