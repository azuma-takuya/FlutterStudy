import 'package:flutter/material.dart';

import 'favorite_bloc.dart';
import 'favorite_bloc_provider.dart';
import 'news_api_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _favoriteBloc = FavoriteBloc();

  @override
  Widget build(BuildContext context) {
    //FavoriteProviderを呼び出し全体で状態を共有
    return FavoriteBlocProvider(
      favoriteBloc: _favoriteBloc,
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsApiScreen(favoriteBloc: _favoriteBloc,),
      ),
    );
  }

  @override
  void dispose() {
    _favoriteBloc.dispose();
    super.dispose();
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'favorite_bloc.dart';
// import 'favorite_manager.dart';
// import 'news_api_screen.dart';
// import 'news_favorite_screen.dart';
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (_) => FavoritesManager(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'News App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const NewsApiScreen(),
//       ),
//     );
//   }
// }
