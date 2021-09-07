import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';

class Phone extends StatelessWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Phone Numbers',
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
    );
  }
}
