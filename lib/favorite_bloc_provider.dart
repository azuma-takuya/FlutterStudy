import 'package:flutter/cupertino.dart';
import 'favorite_bloc.dart';

//ウィジェットツリー内のどのウィジェットでも状態にアクセス
class FavoriteBlocProvider extends InheritedWidget {

  const FavoriteBlocProvider({
    super.key, required this.favoriteBloc, required super.child,
  });

  final FavoriteBloc favoriteBloc;

  //ウィジェットを常に再構築
  @override
  bool updateShouldNotify(FavoriteBlocProvider oldWidget) {
    return true;
  }

  //呼び出した場所で共有状態にアクセスする
  static FavoriteBloc of(BuildContext context) {
    final favoriteBlocProvider = context.dependOnInheritedWidgetOfExactType<FavoriteBlocProvider>()!;
    return favoriteBlocProvider.favoriteBloc;
  }
}
