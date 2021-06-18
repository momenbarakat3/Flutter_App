import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import'models.dart';
import 'SecondPage.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPage extends StatefulWidget {
  @override
  Location location5 ;
  ThirdPage(this.location5) ;
  _pageState createState() => _pageState(this.location5);
}
class _pageState extends State<ThirdPage> {
  Location location5 ;
  _pageState(this.location5) ;

  //get onPressed => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
              title: Text('Details',
                style: TextStyle(color: Colors.white),

              ),
              backgroundColor: Colors.cyan[500]
          ),
          body:
          Column(
            children: <Widget>[
              Container(
                  child:
                  Text(location5.name)
              ),
              Container(
                  child:
                  Image.network(location5.imageUrl)
              ),
              Container(
                  child:
                  Text(location5.description)
              )
            ],
          ),
          floatingActionButton:FloatingActionButton( onPressed : () {launch(location5.locationUrl);},
              child: Text('Click'),
          backgroundColor: Colors.cyan[500],)
      ),
    );
  }
}