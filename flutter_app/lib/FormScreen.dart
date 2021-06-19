import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "SecondScreen.dart";
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
      onChanged: (value) => _locationname = value,
    );
  }

  addData(String name, String theme, String description, String locationUrl,
      String imageUrl) {
    Map<String, dynamic> data = {
      "name": name,
      "theme": theme,
      "description": description,
      "locationUrl": locationUrl,
      "imageUrl": imageUrl
    };
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('data');
    collectionReference.add(data);
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
      onChanged: (value) => _theme = value,
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
      onChanged: (value) => _fulldescription = value,
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
      onChanged: (value) => _imageurl = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form"),backgroundColor: Colors.cyan[500],centerTitle: true,),
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
                ElevatedButton(
                  child: Text('Submit'),
                    style: ElevatedButton.styleFrom(primary: Colors.cyan[500],onPrimary: Colors.white),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    } else {
                      addData(_locationname, _theme, _fulldescription,
                          _locationurl, _imageurl);

                      _formKey.currentState.save();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SecondScreen()));
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
