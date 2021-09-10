import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/screens/pages/detels.dart';

class Info extends StatelessWidget {
  const Info({Key? key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blue, //change your color here
        ),
        title: Text(
          tag,
          style: TextStyle(color: blue),
        ),
        centerTitle: true,
        backgroundColor: bodycolor,
      ),
      backgroundColor: bodycolor,
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('places')
              .where("tag", isEqualTo: tag)
              .snapshots(),
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

    //var i =

    diss = distancelmMeter?.round().toInt();
    setState(() {
      if (diss! > 1000) {
        km = true;

        diss = diss / 1000.toDouble();
      } else {
        diss = diss * 1.toDouble();

        km = false;
      }
    });
  }

  @override
  void initState() {
    print('now');
    print(widget.data['lat']);
    _getDis();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          (diss == null)
              ? Text('data')
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detels(
                            name: widget.data['name'],
                            dis: diss,
                            km: km,
                            address: widget.data['add'],
                            phone: widget.data['phone'],
                            website: widget.data['website'],
                          )),
                );
        },
        child: ListTile(
          title: Text(widget.data['name']),
          subtitle: Text(widget.data['add']),
          trailing: (km == true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('$diss km')])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('$diss metter'),
                  ],
                ),
        ),
      ),
    );
  }
}
