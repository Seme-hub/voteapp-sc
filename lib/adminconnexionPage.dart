import 'package:flutter/material.dart';
import 'package:voteapp/admin_homepage.dart';

class AdminConnexionPage extends StatefulWidget {
  @override
  AdminConnexionPageState createState() => AdminConnexionPageState();
}

class AdminConnexionPageState extends State<AdminConnexionPage> {
  var nameController = TextEditingController();
  var idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("vision.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: height / 30),
                Image.asset(
                  "semecity2.png",
                  width: width / 7,
                  height: height / 10,
                ),
                SizedBox(),
                Text(
                  "Bienvenue sur notre plateforme de vote !",
                  style: TextStyle(
                    color: Color.fromRGBO(11, 35, 111, 1),
                    fontSize: height / 39,
                  ),
                ),
                SizedBox(height: height / 11),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height / 30),
                    color: Color.fromRGBO(11, 35, 111, 1),
                  ),
                  width: width > 1200
                      ? width / 4.5
                      : (width > 1170
                          ? width / 4.35
                          : (width > 900 ? width / 3.5 : width / 2)),
                  height: height / 1.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: height / 17),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: width / 80),
                            Text(
                              "Identifiez-vous",
                              style: TextStyle(
                                fontSize: height / 40,
                                color: Color.fromRGBO(255, 213, 0, 1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 25),
                        Container(
                          width: width > 950 ? width / 6 : width / 4,
                          height: height / 10,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Nom de l'admin",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromRGBO(255, 213, 0, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.circular(height / 25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.circular(height / 25),
                              ),
                              alignLabelWithHint: false,
                            ),
                            controller: nameController,
                          ),
                        ),
                        SizedBox(height: height / 12),
                        Container(
                          width: width > 950 ? width / 6 : width / 4,
                          height: height / 10,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Mot de passe",
                              focusColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.wysiwyg,
                                color: Color.fromRGBO(255, 213, 0, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                    BorderRadius.circular(height / 25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.circular(height / 25),
                              ),
                              alignLabelWithHint: false,
                            ),
                            controller: idController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return ("Entrez un identifiant valide");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: height / 17),
                        Container(
                          width: width > 1000
                              ? width / 8
                              : (width > 720 ? width / 5.5 : width / 4),
                          height: height / 20,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(height / 25),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                if (nameController.text == "SEMEONE" &&
                                    idController.text == "LEVEL") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => AdminPage()),
                                  );
                                }
                              }
                            },
                            child: Text(
                              "Se connecter",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            color: Color.fromRGBO(255, 213, 0, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
