// import 'package:flutter/cupertino.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// @override
// Widget build(BuildContext context, WidgetRef ref) {
//   // `flutter` カテゴリの「ブックマーク」を最大10件取得したい場合の引数の渡し方例
//   final bookmarks = ref.watch(
//     bookmarksProvider(
//       category: 'flutter',
//       limit: 10,
//     ),
//   );
//
//   // 取得できるのは `AsyncValue<List<Bookmark>>` のため、 `when` で取り回しできます
//   return bookmarks.when(
//     loading: () => CircularProgressIndicator.adaptive(),
//     error: (err, stack) => Center(child: Text('error: $err')),
//     data: (bookmarks) {
//       return ListView(
//         children: [
//           for (final bookmark in bookmarks)
//             Text(bookmark.title),
//         ],
//       );
//     },
//   );
// }