import 'dart:async';
import 'package:flutter/material.dart';

class PrayerTimeWidget extends StatefulWidget {
  @override
  _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  List prayerTimes = [
    
  ]; // Replace with your API response

  Timer? _timer;
  int _currentPrayerIndex = -1;
  String _timeLeft = '';

  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is initialized
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _updatePrayerTime();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _updatePrayerTime() {
    final now = DateTime.now();

    // Find the next prayer time
    for (int i = 0; i < prayerTimes.length; i++) {
      if (now.isBefore(DateTime.parse(prayerTimes.toString()[i]))) {
        setState(() {
          _currentPrayerIndex = i;
          _timeLeft = _formatTime(prayerTimes[i].difference(now));
        });
        return;
      }
    }

    // If all prayer times have passed, stop the timer
    _timer?.cancel();
  }

  String _formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            _currentPrayerIndex >= 0
                ? 'Next Prayer Time: ${prayerTimes[_currentPrayerIndex].hour}:${prayerTimes[_currentPrayerIndex].minute}'
                : 'No upcoming prayer time',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            _currentPrayerIndex >= 0 ? 'Time Left: $_timeLeft' : '',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
