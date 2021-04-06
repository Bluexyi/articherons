import 'dart:io';

import 'package:articherons/models/Info.dart';
import 'package:flutter/material.dart';

class ResPage extends StatelessWidget {
  final File image;
  final Info info;

  ResPage({Key key, @required this.image, this.info}) : super(key: key);

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
        child: Center(
          child: Container(
            child: Column(
              children: [
                Image.file(
                  image,
                  width: 250,
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100.0,
                        width: 100.0,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "m3",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Volume du billon",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: 100.0,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "450",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              "Billons reconnus",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Adhérent : " + info.adherent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Client : " + info.client,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Usage : " + info.usage,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Essence : " + info.essence,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Référent : " +
                            info.referent +
                            " de " +
                            info.lgBillon.toString() +
                            "mêtre",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
