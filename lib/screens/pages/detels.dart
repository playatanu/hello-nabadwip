import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/style/textstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class Detels extends StatefulWidget {
  Detels(
      {Key? key,
      required this.name,
      required this.dis,
      required this.km,
      required this.website,
      required this.phone,
      required this.address,
      required this.lat,
      required this.lng});

  final String name, website, phone, address;
  final double dis;
  final bool km;
  final double lat, lng;

  @override
  _DetelsState createState() => _DetelsState();
}

class _DetelsState extends State<Detels> {
  @override
  Widget build(BuildContext context) {
    var ndis = widget.dis;
    var latx = widget.lat;
    var lngx = widget.lng;
    var url = 'https://www.google.com/maps/search/?api=1&query=$latx,$lngx';
    var _initialCameraPosition = CameraPosition(
      target: LatLng(latx, lngx),
      zoom: 14.5,
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blue, //change your color here
        ),
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
          TopDetels(widget: widget, ndis: ndis, url: url),
          Information(widget: widget, url: url, loc: _initialCameraPosition),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.widget,
    required this.url,
    required this.loc,
  }) : super(key: key);

  final Detels widget;
  final String url;
  final CameraPosition loc;

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      (url == null) ? print('$url null') : launch(url);
      print(url);
    }

    Set<Marker> _markers = {};

    _markers.add(Marker(
        markerId: MarkerId('id-1'), position: LatLng(widget.lat, widget.lng)));

    /* lunchmap() async {
      final availableMaps = await MapLauncher.installedMaps;
      print(
          availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

      await availableMaps.first.showMarker(
        coords: Coords(37.759392, -122.5107336),
        title: "Ocean Beach",
      );
    }*/

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
                        InkWell(
                          onTap: () {
                            var url = widget.website;
                            (url == null) ? print('$url null') : launch(url);
                          },
                          child: Text(
                            widget.website,
                            style: writetext,
                          ),
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
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: _launchURL,
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        child: GoogleMap(
                          initialCameraPosition: loc,
                          markers: _markers,
                        ),
                      ))
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
    required this.url,
  }) : super(key: key);

  final Detels widget;
  final String url;
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
                child: InkWell(
                  onTap: () {
                    (url == null) ? print('$url null') : launch(url);
                  },
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
