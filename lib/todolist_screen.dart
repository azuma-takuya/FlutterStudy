import 'package:flutter/material.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodolistScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _todos = [];
  final List<bool> _isEditing = [];

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
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
              onChanged: (value) {
                // 値が変更されるたびにvalidationを実行
                setState(() {
                  _formKey.currentState!.validate();
                });
              },

              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _todos.add(value);
                    _isEditing.add(false); // 編集状態のリストに追加
                    _controller.clear();
                  });
                }
              },
            ) ,
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  if (_isEditing[index]) {
                    // 編集状態の場合、テキストフィールドを表示
                    return TextFormField(
                      key: Key(_todos[index]),
                      controller: TextEditingController(text: _todos[index]),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'タイトルを入力してください';
                        }
                        if (_todos.contains(value)) {
                          return 'このデータはすでに存在します';
                        }
                        return null;
                      },
                      onFieldSubmitted: (newValue) {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _todos[index] = newValue;
                            _isEditing[index] = false;
                          });
                        }
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
      ),
    );
  }
}
