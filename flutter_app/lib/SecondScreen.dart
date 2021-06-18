import 'package:flutter/material.dart';
import 'ThirdPage.dart';
import'data.dart';
import'package:flutter_app/models.dart';
import 'FormScreen.dart';
class SecondScreen extends StatefulWidget {
  @override
  _listState createState() => _listState();
  static BuildContext context;
  static List<Location> locations=(new locationsAll()).listobj;

}

class _listState extends State<SecondScreen> {
  List<Location> locations = SecondScreen.locations;
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
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){

            return Container(
                child: Card(
                  child: Wrap(
                    children: [
                      Image.network(locations[index].imageUrl),
                      ListTile(
                          tileColor: Colors.cyan[50],

                          onTap:  (){
                            navigateToDescription(locations[index]);
                          },
                          title:   Text(locations[index].name),
                          subtitle : Text(locations[index].theme)
                      )
                    ],
                  ),
                )
            );
          },
        ),

        floatingActionButton:FloatingActionButton(  onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormScreen()));
        },
          child: Text('+',),backgroundColor: Colors.cyan[500],
        )
    );
  }


  void navigateToDescription(Location location6){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ThirdScreen(location6)));
  }

}



