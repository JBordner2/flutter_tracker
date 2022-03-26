import 'package:flutter/material.dart';
import 'package:tracker/create_tracker.dart';
import 'package:tracker/messing_around.dart';
import 'package:tracker/stopwatch.dart';
import 'package:tracker/tracked_activity_model.dart';
import 'dart:async';

class Trackers extends StatefulWidget {
  const Trackers({Key? key}) : super(key: key);

  @override
  State<Trackers> createState() => _TrackersState();
}

class _TrackersState extends State<Trackers> {
  final scrollController = ScrollController();
  var mockData = [TrackedActivityModel('Task A', 0), TrackedActivityModel('Task B', 0), TrackedActivityModel('Task C', 0), TrackedActivityModel('Task D', 0), TrackedActivityModel('Task E', 0), TrackedActivityModel('Task F', 0), TrackedActivityModel('Task G', 0)];

  @override
  Widget build(BuildContext context) {
    // print("MADE IT OTO HERE");
     return Scaffold(
       body: Column(
         children: [
           Expanded(child: Scrollbar(
               child: ListView.builder(
                 controller: scrollController,
                 itemExtent: 100,
                 itemCount: mockData.length,
                 itemBuilder: (context, index) {
                   final activity = mockData[index];

                   return Column(
                     children: [
                       StopWatch(activity: activity),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         height: 1,
                         color: Colors.black,
                       )
                     ],
                   );
                 },
               )
           ),
           ),
         ],
       ),

       floatingActionButton: FloatingActionButton(
         onPressed: () {
           Navigator.of(context).push(
             MaterialPageRoute(
               builder: (_) => CreateTracker(),
               // builder: (_) => MessingAround(),
             ),
           );
         },
           child: const Icon(Icons.add),
       ),
     );
  }
}
