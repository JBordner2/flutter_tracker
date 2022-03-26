import 'package:flutter/material.dart';

class SizedBoxFun extends StatefulWidget {
  const SizedBoxFun({Key? key}) : super(key: key);

  @override
  State<SizedBoxFun> createState() => _SizedBoxFunState();
}

class _SizedBoxFunState extends State<SizedBoxFun> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * .75, height: 35, child: Container(color: Colors.red)),
        SizedBox(width: MediaQuery.of(context).size.width * .25, height: 35, child: Container(color: Colors.blue)),
      ]
    );
  }
}
