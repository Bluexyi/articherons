import 'package:articherons/models/Info.dart';
import 'package:articherons/pages/PicturePage.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController adherentController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController lgBillonController = TextEditingController();
  TextEditingController diametreController = TextEditingController();
  String referent = "";
  String usage = "";
  String essence = "";

  Info info = Info();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Text(
          "Articherons",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Text(
                      "Information",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: TextField(
                      controller: adherentController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Adhérent',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: TextField(
                      controller: clientController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Client',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Usage",
                          border: OutlineInputBorder(),
                        ),
                        items: <String>[
                          " ",
                          "Billon",
                          "Caissage",
                          "Canter",
                          "Chauffage",
                          "Deroulage",
                          "Energie",
                          "Fermette",
                          "Grumette",
                          "Menuiserie",
                          "Parquet",
                          "Piquet",
                          "Souche",
                          "Tritu",
                          "Trituration"
                        ].map((String value) {
                          //La fonction crée un objet qui aura la même valeur et le même texte, à partir du tableau d'objet
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            usage = value.toString();
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Essence",
                          border: OutlineInputBorder(),
                        ),
                        items: <String>[
                          " ",
                          "Acacia",
                          "Chataignier",
                          "Chène",
                          "Douglas",
                          "Epicéa",
                          "Frène",
                          "Hêtre",
                          "Peuplier Marin"
                        ].map((String value) {
                          //La fonction crée un objet qui aura la même valeur et le même texte, à partir du tableau d'objet
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            essence = value.toString();
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: lgBillonController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Longueur du billon (cm)',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: diametreController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Diamètre moyen billon (cm)',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Modèle référent",
                          border: OutlineInputBorder(),
                        ),
                        items: <String>[
                          " ",
                          "Etalon",
                          "Billon",
                          "Référent",
                          "Echelle"
                        ].map((String value) {
                          //La fonction crée un objet qui aura la même valeur et le même texte, à partir du tableau d'objet
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            referent = value.toString();
                          });
                        }),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen[600],
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      info.adherent = adherentController.text;
                      info.client = clientController.text;
                      info.lgBillon = int.parse(lgBillonController.text);
                      info.diametre = int.parse(diametreController.text);
                      info.referent = referent;
                      info.usage = usage;
                      info.essence = essence;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PicturePage(
                            info: info,
                          ),
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
      ),
    );
  }
}
