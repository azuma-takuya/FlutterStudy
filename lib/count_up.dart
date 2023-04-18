import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountUp extends StatefulWidget {
  const CountUp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CountUpState createState() => _CountUpState();
}

class _CountUpState extends State<CountUp> {
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
                content: Text('これ以上押せません。'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
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
              'You have pushed the button this many times:',
            ),
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
        child: Icon(Icons.add),
      ),
    );
  }
}
