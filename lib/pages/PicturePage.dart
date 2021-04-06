import 'dart:io';
import 'package:articherons/models/Info.dart';
import 'package:articherons/pages/ResPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PicturePage extends StatefulWidget {

  final Info info;
  PicturePage({Key key, @required this.info}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PicturePage> {

  File _image;
  final picker = ImagePicker();
  

  _openGalery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ajouter une photo"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Galerie"),
                    onTap: () {
                      _openGalery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                  ),
                  GestureDetector(
                    child: Text("Appareil photo"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (_image == null) {
      return Text("Aucune image selectionnée");
    } else {
      return Image.file(
        _image,
        width: 250,
        height: 250,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Text(
          "Articherons",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightGreen[600],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        5.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: _decideImageView(),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen[600], // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    _showChoiceDialogue(context);
                  },
                  child: Text(
                    "Selectionner une image",
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen[600], // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResPage(image: _image, info: widget.info,),
                      ),
                    );
                  },
                  child: Text(
                    "Valider",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
