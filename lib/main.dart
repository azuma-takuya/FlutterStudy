import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todos = [];
  List<bool> _isEditing = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Add new todo',
            ),
            onSubmitted: (value) {
              setState(() {
                _todos.add(value);
                _isEditing.add(false); // 編集状態のリストに追加
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                if (_isEditing[index]) {
                  // 編集状態の場合、テキストフィールドを表示
                  return TextField(
                    key: Key(_todos[index]),
                    controller: TextEditingController(text: _todos[index]),
                    onSubmitted: (newValue) {
                      setState(() {
                        _todos[index] = newValue;
                        _isEditing[index] = false;
                      });
                    },
                  );
                } else {
                  // 通常のリストアイテム表示
                  return ListTile(
                    key: Key(_todos[index]),
                    title: Text(_todos[index]),
                    onTap: () {
                      // ボタンクリックで編集フラグ切り替え
                      setState(() {
                        _isEditing[index] = true;
                      });
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      //アイコンクリックで削除
                      onPressed: () {
                        setState(() {
                          _todos.removeAt(index);
                          _isEditing.removeAt(index);
                        });
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
