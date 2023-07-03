import 'package:countup/favorite_manager.dart';
import 'package:countup/news_favorite_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  late final FavoriteManager favoriteManager;
  NewsResult? newsList;
  List<News>? favorites = [];

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    newsApi = NewsApi(dio);
    favoriteManager = FavoriteManager();
    fetchNews();
    loadFavorites();
  }

  //取得したAPIの情報をnewsListに代入し、状態を更新（再描画）
  Future<void> fetchNews() async {
    try {
      const newsApiKey = String.fromEnvironment('NEWS_API_KEY');
      final response =
      await newsApi.getNews(newsApiKey);
      setState(() {
        newsList = response;
      });
    } on DioError catch (e) { // DioErrorを使用していますが、具体的な例外に合わせて変更してください
      print('Failed to fetch news: $e');
    }
  }

  Future<void> loadFavorites() async {
    await favoriteManager.readFavorites();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // final favoriteManager = Provider.of<FavoriteManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News速報'),
        actions: <Widget>[
          IconButton(
            //リフレッシュアイコンを押すたびにニュースを再取得
            icon: const Icon(Icons.refresh),
            onPressed: fetchNews,
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsFavoriteScreen(favoriteManager: favoriteManager),
                ),
              );
              setState(() {}); // ナビゲーションから戻ったときにウィジェットを更新します。
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
              onPressed: () {
                favoriteManager.toggleFavorite(news!);
                setState(() {}); // <--- Correct usage of setState
              },
            ),
          );
        },
      ),
    );
  }
}
