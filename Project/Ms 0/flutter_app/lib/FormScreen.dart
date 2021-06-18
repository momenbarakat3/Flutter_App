import 'package:flutter/material.dart';
import 'package:flutter_app/SecondPage.dart';
import 'package:flutter_app/data.dart';
import "data.dart";
import "ThirdPage.dart";
import 'models.dart';


class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _locationname;
  String _theme;
  String _fulldescription;
  String _locationurl;
  String _imageurl;
  Location location;
  int id;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildLocationName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onChanged: (value) => _locationname= value,
    );
  }

  Widget _buildTheme() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Theme'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Theme is Required';
        }
        return null;
      },
      onChanged: (value) => _theme= value,

    );
  }

  Widget _buildFullDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Full Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Full Description is required';
        }

        return null;
      },
      onChanged: (value) => _fulldescription= value,
    );
  }

  Widget _builLocationURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Location Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return ' Location URL is Required';
        }

        return null;
      },
      onChanged: (value) => _locationurl = value,
    );
  }

  Widget _buildImageURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Image Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Image Url is Required';
        }

        return null;
      },
      onChanged: (value) => _imageurl  = value,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Form"),
          backgroundColor: Colors.cyan[500]),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLocationName(),
                _buildTheme(),
                _buildFullDescription(),
                _builLocationURL(),
                _buildImageURL(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text('Submit',
                    style: TextStyle(color: Colors.cyan[500], fontSize: 15,),
                  ),

                  onPressed: () {

                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    else {
                      location = new Location(id: 6,
                          name: _locationname,
                          theme: _theme,
                          description: _fulldescription,
                          imageUrl: _imageurl,
                          locationUrl: _locationurl);
                      SecondPage.locations.add(location);
                      //print(_locationname);
                      //print(_theme);
                      //print(_fulldescription);
                      //print(_locationurl);
                      //print(_imageurl);
                      _formKey.currentState.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));

                      //Send to API
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }



}