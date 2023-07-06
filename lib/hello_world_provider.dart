import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

part 'hello_world_provider.g.dart';

@riverpod
String label(LabelRef ref) => 'Hello world';

void main() {
  runApp(const ProviderScope(child: Home()));
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Text(ref.watch(labelProvider)),
      ),
    );
  }
}
