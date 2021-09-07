import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'NVC',
            style: TextStyle(color: blue),
          ),
          centerTitle: true,
          backgroundColor: bodycolor,
        ),
        backgroundColor: bodycolor);
  }
}
