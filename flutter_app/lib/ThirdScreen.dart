import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdScreen extends StatefulWidget {
  @override
  int index;
  ThirdScreen(this.index) ;
  _pageState createState() => _pageState(this.index);
}
class _pageState extends State<ThirdScreen> {
  int index;
  _pageState(this.index) ;

  //get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan[500],
              title: Text('Details',
                style: TextStyle(color: Colors.white),
              ),centerTitle: true,
          ),
          body:
              StreamBuilder(
              stream: FirebaseFirestore.instance.collection('data').snapshots(),
               builder: (context, snapshot) {
                return Column(
                children: <Widget>[
                  Container(
                      child: Text(snapshot.data.docs[index]['name'])),
                  Container(
                      child:
                    Image.network(snapshot.data.docs[index]['imageUrl'])),
                  Container(
                      child: Text(snapshot.data.docs[index]['description'])),
                  FloatingActionButton(
                 backgroundColor: Colors.cyan[500],
                      foregroundColor: Colors.white,
                      onPressed: () {
                        launch(snapshot.data.docs[index]['locationUrl']);
                          },
                      child: Icon(Icons.map)
                         )
                      ],
                    );
                  }
               ),
            ),
          );
      }
    }