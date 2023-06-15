import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FavoritesManager.dart';
import 'news_api_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritesManager(),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsApiScreen(),
      ),
    );
  }
}
