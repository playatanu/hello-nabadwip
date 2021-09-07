import 'package:flutter/material.dart';
import 'package:nabadwip/colors/maincolors.dart';
import 'package:nabadwip/style/textstyle.dart';
import 'package:nabadwip/widgets/customslider.dart';
import 'package:nabadwip/widgets/minicatagory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> images = [
    "https://i.pinimg.com/474x/f3/45/9e/f3459ea6ac08990c954418fb118228c0.jpg",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];

  @override
  void setState(VoidCallback fn) {
    FirebaseFirestore.instance.collection("places").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
    super.setState(fn);
  }

  void fire() {
    FirebaseFirestore.instance.collection("places").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
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
                style: TextStyle(
                    fontSize: 12,
                    color: Color(
                      (0xFF201F41),
                    )),
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
              Container(
                width: double.infinity,
                height: 150,
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('tag').snapshots(),
                  builder: (context, snapshot) {
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      children:
                          List.generate(snapshot.data!.docs.length, (index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];

                        return Center(
                          child: SelectCard(
                            data: data,
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFE7E8F2),
    );
  }
}
/*
 itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];*/

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.data});
  final DocumentSnapshot<Object?> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
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
