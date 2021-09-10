import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/style/textstyle.dart';

class Detels extends StatefulWidget {
  Detels(
      {Key? key,
      required this.name,
      required this.dis,
      required this.km,
      required this.website,
      required this.phone,
      required this.address});

  final String name, website, phone, address;
  final double dis;
  final bool km;

  @override
  _DetelsState createState() => _DetelsState();
}

class _DetelsState extends State<Detels> {
  @override
  Widget build(BuildContext context) {
    var ndis = widget.dis;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
      body: Column(
        children: [
          Image(image: NetworkImage('')),
          TopDetels(widget: widget, ndis: ndis),
          Information(widget: widget),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Detels widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Information",
                textAlign: TextAlign.left,
                style: minitext,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0), topRight: Radius.circular(0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "Name: ",
                          style: writetext,
                        ),
                        Text(
                          widget.name,
                          style: writetext,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "Address: ",
                          style: writetext,
                        ),
                        Text(
                          widget.address,
                          style: writetext,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "Phone: ",
                          style: writetext,
                        ),
                        Text(
                          widget.phone,
                          style: writetext,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "website: ",
                          style: writetext,
                        ),
                        Text(
                          widget.website,
                          style: writetext,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopDetels extends StatelessWidget {
  const TopDetels({
    Key? key,
    required this.widget,
    required this.ndis,
  }) : super(key: key);

  final Detels widget;

  final double ndis;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(''),
                fit: BoxFit.cover,
              ),
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          height: 100,
        ),
        Container(
          decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.name,
                  style: minitext,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.north_east,
                        color: white,
                      ),
                    ),
                    (widget.km == true)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              '$ndis K.M.',
                              style: minitext,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              '$ndis Meter',
                              style: minitext,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
