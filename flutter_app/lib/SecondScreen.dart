import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'ThirdScreen.dart';
import 'FormScreen.dart';

class SecondScreen extends StatefulWidget {
  @override
  _listState createState() => _listState();
  static BuildContext context;
  //static List<Location> locations=(new locationsAll()).listobj;

}

class _listState extends State<SecondScreen> {
  //List<Location> locations = SecondScreen.locations;
  @override
  Widget build(BuildContext context) {
    SecondScreen.context=context;
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourite Locations',
            style: TextStyle(color: Colors.white),
          ) ,
          centerTitle: true ,
          backgroundColor: Colors.cyan[500] ,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount:snapshot.data.docs.length ,
              itemBuilder: (context, index) {
                return Container(
                    child: Card(
                      child: Wrap(
                        children: [
                          Image.network(snapshot.data.docs[index]['imageUrl']),
                          ListTile(
                            tileColor: Colors.cyan[50],
                                onTap: () {
                                navigateToDescription(index);
                                },
                            title: Text(snapshot.data.docs[index]['name']),
                                subtitle: Text(snapshot.data.docs[index]['theme']))
                        ],
                      ),
                    ));
              },
            );
          }),

        floatingActionButton:FloatingActionButton(
            backgroundColor: Colors.cyan[500],
            foregroundColor: Colors.white,
            onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormScreen()));
        },
           // child: Text('+',),backgroundColor: Colors.cyan[500],
         child: Icon(Icons.add)

        )
    );
  }


  void navigateToDescription(int i){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreen(i)));
  }

}



