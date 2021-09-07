import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';

class Nearest extends StatefulWidget {
  const Nearest({Key? key}) : super(key: key);

  @override
  _NearestState createState() => _NearestState();
}

class _NearestState extends State<Nearest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nearest Places',
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
    );
  }
}
