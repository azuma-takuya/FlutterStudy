import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  StopwatchState createState() => StopwatchState();
}

extension _IntZeroPadding on int {
  String get _toStringWithZeroPadding => toString().padLeft(2, '0');
}

class StopwatchState extends State<StopwatchScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  Duration _displayDuration = Duration.zero;

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
    _displayDuration = Duration.zero;
      _stopwatch
        ..stop()
        ..reset();
    }

  String formatTime(Duration duration) {
    final minutes = duration.inMinutes.remainder(60)._toStringWithZeroPadding;
    final seconds = duration.inSeconds.remainder(60)._toStringWithZeroPadding;
    final milliseconds = (duration.inMilliseconds.remainder(1000) / 10).
    floor()._toStringWithZeroPadding;
    return '$minutes:$seconds.$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 少数第二位までの計測時間を表示
            Text(
              formatTime(_displayDuration),
              style: const TextStyle(
                  fontSize: 60,
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,),
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
      ),
    );
  }
}
