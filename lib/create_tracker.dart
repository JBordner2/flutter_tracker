import 'package:flutter/material.dart';

class CreateTracker extends StatefulWidget {
  const CreateTracker({Key? key}) : super(key: key);

  @override
  State<CreateTracker> createState() => _CreateTrackerState();
}

class _CreateTrackerState extends State<CreateTracker> {

  final _activityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create A New Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Activty'),
                //TODO: Add validation that the description does not already exist
                // validator: (text) => (text ?? "").isEmpty ? 'Set your activity' : null,
                controller: _activityController,
              ),
            ),

            Container(
                child: ElevatedButton(
                  onPressed: _validate,
                  child: Text('Submit'),
                )
            )
          ],
        ),
      )
    );
  }

  void _validate() {
    final formIsValid = (_activityController.text.isEmpty == false);
    print(formIsValid);
  // print
    if (!formIsValid) {
      return;
    }

    //TODO: Figure out how we are going to pass data around
    Navigator.of(context).pop(context);
  }
}
