// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:path_provider/path_provider.dart';
// import 'model/news.dart';
//
// class FavoritesManager with ChangeNotifier {
//   List<News>? favorites = [];
//
//   Future<File> get _localFile async {
//     final path = (await getApplicationDocumentsDirectory()).path;
//     return File('$path/favorites.json');
//   }
//
//   Future<void> readFavorites() async {
//     try {
//       final file = await _localFile;
//       final contents = await file.readAsString();
//       final jsonData = json.decode(contents) as List;
//       favorites = jsonData.map((item) =>
//           News.fromJson(item as Map<String, dynamic>),).toList();
//     } catch (e) {
//       print('Unable to read favorites: $e');
//     }
//     notifyListeners();
//   }
//
//   Future<void> writeFavorites() async {
//     final file = await _localFile;
//     await file.writeAsString(json.encode(favorites));
//     notifyListeners();
//   }
//
//   void addFavorite(News news) {
//     favorites!.add(news);
//     writeFavorites();
//     notifyListeners();
//   }
//
//   void removeFavorite(News news) {
//     favorites!.removeWhere((item) => item.url == news.url);
//     writeFavorites();
//     notifyListeners();
//   }
//
//   void toggleFavorite(News news) {
//     if (favorites!.any((favorite) => favorite.url == news.url)) {
//       removeFavorite(news);
//     } else {
//       addFavorite(news);
//     }
//   }
//
//   bool isFavorite(News? news) {
//     if (news == null) {
//       return false;
//     }
//     return favorites!.any((favorite) => favorite.url == news.url);
//   }
// }
