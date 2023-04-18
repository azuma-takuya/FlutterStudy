import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountUpPage extends StatefulWidget {
  const CountUpPage({super.key, required this.title}) : super();

  final String title;

  @override
  State createState() => _CountUpPageState();
}

class _CountUpPageState extends State<CountUpPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if(_counter < 100) {
        _counter++;
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: const Text('これ以上押せません。'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            }
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
