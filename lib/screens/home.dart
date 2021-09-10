import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/style/textstyle.dart';
import 'package:nabadwip/widgets/customslider.dart';
import 'package:nabadwip/widgets/minicatagory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'pages/info.dart';

// ignore: must_be_immutable
class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  "Let's Go",
                  style: TextStyle(color: blue, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  child: Icon(
                    Icons.near_me,
                    color: blue,
                  ),
                  backgroundColor: bodycolor,
                ),
              ],
            ),
          )
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                    color: Color(
                  (0xFF201F41),
                )),
              ),
              Text(
                'Nabadwip',
                style: appbarminitext,
              ),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: bodycolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          //main home page
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //slider
              CustomSlider(),
              MiniMenu(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Top Places', style: bigtext),
              ),
              TopPlaces(tag: 'tag'),
              TopPlaces(
                tag: 'tag',
              ),
              TopPlaces(tag: 'tag'),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFE7E8F2),
    );
  }
}

class TopPlaces extends StatelessWidget {
  const TopPlaces({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(tag).snapshots(),
        builder: (context, snapshot) {
          return GridView.count(
            mainAxisSpacing: 4.0,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 8.0,
            crossAxisCount: 1,
            children: List.generate(snapshot.data!.docs.length, (index) {
              DocumentSnapshot data = snapshot.data!.docs[index];

              return SelectCard(
                data: data,
              );
            }),
          );
        },
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.data});
  final DocumentSnapshot<Object?> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Info(
                      tag: data['tag'],
                    )),
          );
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data['img']),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              height: 40,
              child: Container(
                  child: Center(
                child: Text(
                  data['name'],
                  style: minitext,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class MiniMenu extends StatelessWidget {
  const MiniMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Minicatagory(
              imgurl: '',
              text: 'Bus',
            ),
            Minicatagory(
              imgurl: '',
              text: 'Market',
            ),
            Minicatagory(
              imgurl: '',
              text: 'Hospital',
            ),
            Minicatagory(
              imgurl: '',
              text: 'Clinik',
            ),
            Minicatagory(
              imgurl: '',
              text: 'Mall',
            ),
          ],
        ),
      ),
    );
  }
}
