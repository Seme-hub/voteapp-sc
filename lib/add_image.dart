import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:voteapp/addCandidate_page.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:provider/provider.dart';
import 'package:voteapp/admin_homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class AddImage extends StatefulWidget {
  AddImageState createState() => AddImageState();
}

class AddImageState extends State<AddImage> {
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

  String link;

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
            Text(
              "Vous pensez avoir tous les atouts et être des compétiteurs redoutables, inscrivez-vous sur la liste des candidats.",
              style: GoogleFonts.openSans(
                fontSize: height / 36,
                color: Color.fromRGBO(1, 77, 152, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Tous les candidats à Sèmè One  en  2ème ou 3ème année peuvent  se  présenter et cela  quelle que soit la filière.",
              style: GoogleFonts.openSans(
                fontSize: height / 36,
                color: Color.fromRGBO(1, 77, 152, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height / 13),
            Text(
              "Uploadez votre photo professionnelle de candidature ci-dessous:",
              style: GoogleFonts.openSans(
                fontSize: height / 36,
                color: Color.fromRGBO(1, 77, 152, 1),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height / 25),
            Container(
              width: width > 700 ? width / 6.5 : 100,
              height: height / 12,
              child: FlatButton(
                color: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      color: Color.fromRGBO(255, 213, 0, 1),
                    ),
                    SizedBox(width: width / 170),
                    Text("Photo de candidature"),
                  ],
                ),
                onPressed: () async {
                  await uploadString();
                },
              ),
            ),
            SizedBox(height: height / 15),
            Container(
              width: width > 700 ? width / 6.6 : width / 3.7,
              height: height / 16,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Color.fromRGBO(1, 77, 152, 1),
                child: Text(
                  "CONTINUER",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 213, 0, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
