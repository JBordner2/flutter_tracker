//TODO: Try to run without async so I can become familiar with debugging issues where async pacakge is needed
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tracker/sized_box_fun.dart';
import 'package:tracker/tracked_activity_model.dart';

class StopWatch extends StatefulWidget {

  final TrackedActivityModel activity;
  const StopWatch({Key? key, required this.activity}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {

  late Timer timer;
  int milliseconds = 0;

  //TODO: Look into better way of making usage of method Timer.isActive
  var timerIsActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * .75, child: _activityAndTrackedTimeDisplay(widget.activity)),
        _startStopTimerDisplay(),
      ],
    );
  }

  Widget _startStopTimerDisplay() {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(Icons.play_arrow),
          onPressed: _startTimer,
        ),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: _stopTimer,
          // child: Text('Stop'),
          child: Icon(Icons.pause),
        ),
      ],
    );
  }

  Widget _activityAndTrackedTimeDisplay(TrackedActivityModel activity) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(activity.activityName),
          SizedBox(height: 20),
          // Text(_secondsText(activity.trackedTimeInMilliseconds))
          Text(_secondsText(milliseconds))
        ],
      ),
    );
  }

  void _startTimer() {
    if (timerIsActive == false) {
      timer = Timer.periodic(Duration(milliseconds: 100),
    _onTick);
      timerIsActive = true;
    }
  }

  void _stopTimer() {
    timer.cancel();
    timerIsActive = false;
  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
      // widget.activity.trackedTimeInMilliseconds += 100;
    });
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  // @override void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }
}
