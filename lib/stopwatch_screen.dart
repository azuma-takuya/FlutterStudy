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

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _timer?.cancel();
      _stopwatch.stop();
    }
  }

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
          Text(
            _displayDuration.toString().split('.')[0].padLeft(8, '0'),
            style: const TextStyle(fontSize: 40),
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
