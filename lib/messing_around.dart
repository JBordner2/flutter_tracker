import 'package:flutter/material.dart';
import 'package:tracker/create_tracker.dart';

class MessingAround extends StatefulWidget {
  const MessingAround({Key? key}) : super(key: key);

  @override
  State<MessingAround> createState() => _MessingAroundState();
}

class _MessingAroundState extends State<MessingAround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text('Start'),
            onPressed: null,
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: null,
            child: Text('Stop'),
          ),
        ],
      ),
    );
  }
}
