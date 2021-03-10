import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:voteapp/candidatepage.dart';
import 'package:provider/provider.dart';
import 'package:voteapp/admin_homepage.dart';

class ConnexionPage extends StatefulWidget {
  @override
  ConnexionPageState createState() => ConnexionPageState();
}

class ConnexionPageState extends State<ConnexionPage> {
  var nameController = TextEditingController();
  var idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> isCandidate(String name, String id) {
    CollectionReference votants =
        FirebaseFirestore.instance.collection("Votants");
    int isCand = 0;

    return votants.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            if (doc["name"] == name && doc["id"] == id) isCand = 1;
          }),
          Provider.of<CheckVotant>(context, listen: false)
              .updateVotant(b: isCand),
        });
  }

  Future<void> getAll() {
    CollectionReference cand =
        FirebaseFirestore.instance.collection("Candidats");
    var namelist = List();
    var descriptionlist = List();
    var photolist = List();
    var lienlist = List();
    var allist = List();

    return cand.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            namelist.add(doc["name"]);
            descriptionlist.add(doc["description"]);
            photolist.add(doc["photo"]);
            lienlist.add(doc["lien"]);
          }),
          allist.add(namelist),
          allist.add(descriptionlist),
          allist.add(photolist),
          allist.add(lienlist),
          Provider.of<CandidateInfo>(context, listen: false)
              .updateCandidateInfo(laliste: allist),
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int a = 0;
    var maliste = List();
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
                      ? width / 4
                      : (width > 1170
                          ? width / 4.3
                          : (width > 900 ? width / 3.4 : width / 1.2)),
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
                              " Identifiez-vous ",
                              style: TextStyle(
                                fontSize: height / 40,
                                color: Color.fromRGBO(255, 213, 0, 1),
                              ),
                            ),
                            Text(
                              "pour y accéder",
                              style: TextStyle(
                                fontSize: height / 40,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: width / 80),
                          ],
                        ),
                        SizedBox(height: height / 25),
                        Container(
                          width: width > 950 ? width / 6 : (width > 760 ? width / 2.7 : width / 1.8),
                          height: height / 9,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Nom de famille",
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
                          width: width > 950 ? width / 6 : (width > 760 ? width / 2.7 : width / 1.8),
                          height: height / 9,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "ID Sèmè One (Ex: EPIXXXXX)",
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
                              if (!(value.contains("EPI") ||
                                  value.contains("AAD") ||
                                  value.contains("SEM"))) {
                                return ("Entrez un identifiant valide");
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: height / 20),
                        Container(
                          width: width > 1000
                              ? width / 8
                              : (width > 720 ? width / 5.5 : width / 2),
                          height: height / 20,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(height / 25),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await isCandidate(
                                    nameController.text, idController.text);
                                a = Provider.of<CheckVotant>(context,
                                        listen: false)
                                    .getUpdateVotant();
                                if (a == 1) {
                                  maliste.add(nameController.text);
                                  maliste.add(idController.text);
                                  Provider.of<GetVotant>(context, listen: false)
                                      .updateVotant(liste: maliste);

                                  await getAll();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => CandidatePage()),
                                  );
                                  nameController.text = "";
                                  idController.text = "";
                                } else if (a == 0) {
                                  if (nameController.text == "ADMIN" &&
                                      idController.text == "ADMIN") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => AdminPage()),
                                    );
                                  }
                                }
                              }
                            },
                            child: Text(
                              "Accéder au vote",
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
