import 'package:flutter/material.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodolistScreen> {
  final _formKey = GlobalKey<FormState>();
  final _editKey = GlobalKey<FormState>();
  final List<String> _todos = [];

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _editController = TextEditingController();

  void deleteTask(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void addTask(String value) {
    setState(() {
      _todos.add(value);
    });
    _controller.clear();
  }

  void editTask(String value, int index) {
    _editController.text = value;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('編集'),
          content: Form(
            key: _editKey,
            child: TextFormField(
              controller: _editController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'タイトルを入力してください';
                } else if (_todos.contains(value)) {
                  return 'このデータはすでに存在します';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_editKey.currentState!.validate()) {
                  setState(() {
                    _todos[index] = _editController.text;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Todoリストを追加',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'タイトルを入力してください';
                }
                if (_todos.contains(value)) {
                  return 'このデータはすでに存在します';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  addTask(value);
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todoList = _todos[index];
                // 編集状態の場合、テキストフィールドを表示
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 通常のリストアイテム表示
                    Expanded(
                        child: ListTile(
                      key: Key(todoList),
                      title: Text(todoList),
                      onTap: () {
                        // ボタンクリックで編集フラグ切り替え
                        editTask(todoList, index);
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        //アイコンクリックで削除
                        onPressed: () {
                          deleteTask(index);
                        },
                      ),
                    ),)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
