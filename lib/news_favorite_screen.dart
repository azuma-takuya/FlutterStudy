import 'package:flutter/material.dart';
import 'favorite_bloc.dart';
import 'model/news.dart';

class NewsFavoritesScreen extends StatelessWidget {

  const NewsFavoritesScreen({super.key, required this.favoriteBloc});
  final FavoriteBloc favoriteBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: StreamBuilder<List<News>>(
        //nullチェックを行う
        stream: favoriteBloc.favoritesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('お気に入りは登録されていません'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final news = snapshot.data![index];
              return ListTile(
                title: Text(news.title ?? 'No title'),
                subtitle: Text(news.url ?? 'No URL'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    favoriteBloc.toggleFavorite(news);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}




// import 'package:countup/favorite_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'favorite_manager.dart';
//
// class NewsFavoritesScreen extends StatelessWidget {
//   const NewsFavoritesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final favoritesManager = Provider.of<FavoritesManager>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorites'),
//       ),
//       body: ListView.builder(
//         itemCount: favoritesManager.favorites!.length,
//         itemBuilder: (context, index) {
//           final news = favoritesManager.favorites![index];
//           return ListTile(
//             title: Text(news.title ?? 'No title'),
//             subtitle: Text(news.url ?? 'No URL'),
//             trailing: IconButton(
//               icon: const Icon(Icons.delete),
//               onPressed: () {
//                 favoritesManager.removeFavorite(news);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
