import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/style/textstyle.dart';

class Minicatagory extends StatelessWidget {
  const Minicatagory({Key? key, required this.imgurl, required this.text});

  final String imgurl, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: 50,
            width: 65,
          ),
          Container(
            decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            height: 20,
            width: 65,
            child: Container(
                child: Center(
              child: Text(
                text,
                style: minitext,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
