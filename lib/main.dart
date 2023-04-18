import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo List',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todos = [];
  final List<Key> _keys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List'),
        ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Add new todo',
            ),
            onSubmitted: (value) {
              setState(() {
                _todos.add(value);
                _keys.add(Key(value)); // キーを追加する
              });
              },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: _keys[index], // キーを指定する
                  title: Text(_todos[index]),
                  onTap: () {
                    // TODOアイテムがタップされたときの処理
                  },
                );
                },
            ),
          ),
        ],
      ),
    );
  }
}
