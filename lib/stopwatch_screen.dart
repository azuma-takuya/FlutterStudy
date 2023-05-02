import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  StopWatchState createState() => StopWatchState();
}

class StopWatchState extends State<StopWatchScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stopwatch App'),
        ),
        body: const StopwatchPage(),
      ),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  StopwatchPageState createState() => StopwatchPageState();
}

class StopwatchPageState extends State<StopwatchPage> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _displayDuration = Duration();

  // 計測されてない場合に計測をする
  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _displayDuration = _stopwatch.elapsed;
        });
      });
      _stopwatch.start();
    }
  }

  //計測を止める
  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _timer?.cancel();
      _stopwatch.stop();
    }
  }

  //計測をリセットする
  void _resetStopwatch() {
    _timer?.cancel();
    setState(() {
      _stopwatch.reset();
      _displayDuration = Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 少数第二位までの計測時間を表示
          Text(
            '${_displayDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_displayDuration.inSeconds.remainder(60).toString().padLeft(2, '0')}.${(_displayDuration.inMilliseconds.remainder(1000) / 10).floor().toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 40, fontFamily: 'Courier'),
          ),

          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startStopwatch,
                child: const Text('Start'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _stopStopwatch,
                child: const Text('Stop'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _resetStopwatch,
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}