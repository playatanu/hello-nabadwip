import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nabadwip/colors/maincolors.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About App',
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('places').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];

                  return FullListItemBuild(data: data);
                });
          },
        ),
      ),
    );
  }
}

class FullListItemBuild extends StatefulWidget {
  const FullListItemBuild({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DocumentSnapshot<Object?> data;

  @override
  _FullListItemBuildState createState() => _FullListItemBuildState();
}

class _FullListItemBuildState extends State<FullListItemBuild> {
  Position? _currentUserPosition;
  double? distancelmMeter = 0.0;

  bool km = true;
  var diss;

  @override
  void initState() {
    print('c');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future _getDis() async {
      _currentUserPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print(_currentUserPosition!.latitude);
      print(_currentUserPosition!.longitude);

      distancelmMeter = await Geolocator.distanceBetween(
          _currentUserPosition!.latitude,
          _currentUserPosition!.longitude,
          widget.data['lat'],
          widget.data['lng']);

      diss = distancelmMeter?.round().toInt();

      if (diss! > 1000) {
        km = true;

        diss = diss / 1000;
      } else {
        km = false;
      }
    }

    _getDis();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ListTile(
        title: Text(widget.data['name']),
        subtitle: Text(widget.data['tag']),
        trailing: (km == true) ? Text('$diss km') : Text('$diss metter'),
      )),
    );
  }
}
