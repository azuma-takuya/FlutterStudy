import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'model/news.dart';

class FavoriteBloc {
  final List<News> _favorites = [];
  final _favoriteController = StreamController<List<News>>.broadcast();

  FavoriteBloc() {
    readFavorites();
  }

  Stream<List<News>> get favoritesStream => _favoriteController.stream;

  Future<void> readFavorites() async {
    final file = await _localFile;
    if (await file.exists()) {
      final contents = await file.readAsString();
      final jsonData = json.decode(contents) as List;
      _favorites.addAll(jsonData.map((item) => News.fromJson(item as Map<String, dynamic>)).toList());
      _favoriteController.sink.add(_favorites);
    } else {
      _favoriteController.sink.add(_favorites);
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/favorites.json');
  }

  void toggleFavorite(News news) {
    if (_favorites.contains(news)) {
      _favorites.remove(news);
    } else {
      _favorites.add(news);
    }
    _favoriteController.sink.add(_favorites);
    writeFavorites();
  }

  Future<void> writeFavorites() async {
    final file = await _localFile;
    await file.writeAsString(json.encode(_favorites.map((news) => news.toJson()).toList()));
  }

  void dispose() {
    _favoriteController.close();
  }
}
