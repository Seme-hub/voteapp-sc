import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:voteapp/admin_homepage.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:convert';
import 'package:voteapp/home_page.dart';

class AddPage extends StatefulWidget {
  AddPageState createState() => AddPageState();
}

class AddPageState extends State<AddPage> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var lienController = TextEditingController();
  String link;

  Future<void> addCandidate(
      String name, String description, String link, String photo) async {
    await Firebase.initializeApp();
    CollectionReference candidats =
        FirebaseFirestore.instance.collection("Candidats");
    return candidats
        .add({
          "name": name,
          "description": description,
          "lien": link,
          "photo": photo,
        })
        .then((value) => print("candidat ajouté"))
        .catchError((error) => print("Failed to add candidate : $error"));
  }

  Future<void> uploadString() async {
    await Firebase.initializeApp();
    FilePickerResult result = await FilePicker.platform.pickFiles();
    PlatformFile file;
    String img64;
    String ext;
    var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    var imageUrl;

    if (result != null) {
      file = result.files.first;
      ext = file.extension;
      img64 = base64Encode(file.bytes);
    }

    var firebaseStorageRef =
        FirebaseStorage.instance.ref("images/$imageFileName.$ext");
    UploadTask task =
        firebaseStorageRef.putString(img64, format: PutStringFormat.base64);

    task.whenComplete(() async {
      try {
        imageUrl = await firebaseStorageRef.getDownloadURL();
        Provider.of<Getlink>(context, listen: false)
            .updateLink(e: imageUrl.toString());
      } catch (onError) {
        print("Error");
      }
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height / 60),
            Image.asset("semecity.png", width: width / 4, height: height / 6),
            SizedBox(height: height / 30),
            Container(
              width: width > 720 ? width / 5 : width / 3.8,
              height: height / 10,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Nom et prénom du candidat",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color.fromRGBO(255, 213, 0, 1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  alignLabelWithHint: false,
                ),
                controller: nameController,
              ),
            ),
            SizedBox(height: height / 25),
            Container(
              width: width > 720 ? width / 5 : width / 3.8,
              height: height / 10,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Description",
                  prefixIcon: Icon(
                    Icons.description,
                    color: Color.fromRGBO(255, 213, 0, 1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  alignLabelWithHint: false,
                ),
                controller: descriptionController,
              ),
            ),
            SizedBox(height: height / 25),
            Container(
              width: width > 720 ? width / 5 : width / 3.8,
              height: height / 10,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Lien vers sa présentation",
                  prefixIcon: Icon(
                    Icons.link,
                    color: Color.fromRGBO(255, 213, 0, 1),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(height / 25),
                  ),
                  alignLabelWithHint: false,
                ),
                controller: lienController,
              ),
            ),
            SizedBox(height: height / 25),
            SizedBox(height: height / 15),
            Container(
              width: width > 700 ? width / 7 : width / 5.5,
              height: height / 20,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Color.fromRGBO(1, 77, 152, 1),
                child: Text(
                  "AJOUTER",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 213, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  link = Provider.of<Getlink>(context, listen: false)
                      .getUpdateLink();

                  await addCandidate(
                    nameController.text,
                    descriptionController.text,
                    lienController.text,
                    link,
                  );
                  alerter(height, width);
                  nameController.text = "";
                  descriptionController.text = "";
                  lienController.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void alerter(double height, double width) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Votre candidature a été validée.",
      desc: "À Bientôt !!",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: height / 35),
          ),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstPage())),
          width: width / 4,
        )
      ],
    ).show();
  }
}
