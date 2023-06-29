import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'model/news.dart';

class FavoriteManager {
  List<News>? favorites = [];

  //ドキュメントディレクトリへのパスを取得
  Future<File> get _localFile async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/favorites.json');
  }

  //ローカルファイルからお気に入りを読み込む
  Future<void> readFavorites() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final jsonData = json.decode(contents) as List<Map<String, dynamic>>;
      favorites = jsonData.map((item) =>
          News.fromJson(item as Map<String, dynamic>),).toList();
    } catch (e) {
      print('Unable to read favorites: $e');
    }
  }

  //追加したお気に入りをローカルレジストリに保存
  Future<void> writeFavorites() async {
    final file = await _localFile;
    await file.writeAsString(json.encode(favorites));
  }

  //お気に入り追加
  void addFavorite(News news) {
    favorites!.add(news);
    writeFavorites();
  }

  //お気に入り削除
  void removeFavorite(News news) {
    favorites!.removeWhere((item) => item.url == news.url);
    writeFavorites();
  }

  //お気に入りに存在すれば削除、ない場合は追加する
  void toggleFavorite(News news) {
    if (favorites!.any((favorite) => favorite.url == news.url)) {
      removeFavorite(news);
    } else {
      addFavorite(news);
    }
  }

  //お気に入りに存在する場合true、それ以外はfalseを返す
  bool isFavorite(News? news) {
    if (news == null) {
      return false;
    }
    //favoriteとnewsのurlが一致していればtrue、一致していなければfalse
    return favorites!.any((favorite) => favorite.url == news.url);
  }
}
