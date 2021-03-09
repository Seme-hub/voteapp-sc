import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:voteapp/failure_vote.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:provider/provider.dart';
import 'package:voteapp/success_vote.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidatePage extends StatefulWidget {
  @override
  CandidatePageState createState() => CandidatePageState();
}

class CandidatePageState extends State<CandidatePage> {
  Future<void> blockVotant(String name, String id) async {
    await Firebase.initializeApp();
    CollectionReference blocked =
        FirebaseFirestore.instance.collection("Blocked");
    return blocked
        .add({
          "name": name,
          "id": id,
        })
        .then((value) => print("Votant bloqué"))
        .catchError((error) => print("Failed to add user : $error"));
  }

  Future<void> isBlocked(String name, String id) async {
    await Firebase.initializeApp();
    CollectionReference blocked =
        FirebaseFirestore.instance.collection("Blocked");
    int isBlock = 0;

    return blocked.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            if (doc["name"] == name && doc["id"] == id) isBlock = 1;
          }),
          Provider.of<CheckBlock>(context, listen: false)
              .updateBlockVotant(b: isBlock),
        });
  }

  Future<void> giveVote(String candidate) async {
    await Firebase.initializeApp();
    CollectionReference users = FirebaseFirestore.instance.collection("Votes");
    return users
        .add({
          "candidate": candidate,
        })
        .then((value) => print("Vote done"))
        .catchError((error) => print("Failed to add user : $error"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var maliste = Provider.of<CandidateInfo>(context, listen: false)
        .getUpdateCandidateInfo();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 6.7,
              width: width,
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset("semecity.png",
                      width: width / 6, height: height / 9),
                  SizedBox(height: height / 200),
                  Text(
                    "Bienvenue sur notre plateforme de vote !",
                    style: TextStyle(
                      fontSize: height / 40,
                      color: Color.fromRGBO(1, 77, 152, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 30),
            Container(
              width: width,
              height: height - (height / 5),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage("vision.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(height / 20),
                      itemCount: maliste[0].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            width > 1200 ? 3 : (width > 785 ? 2 : 1),
                        crossAxisSpacing: width / 30,
                        mainAxisSpacing: width / 20,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return createCard(
                            maliste[2][index],
                            width,
                            height,
                            maliste[0][index],
                            maliste[1][index],
                            maliste[3][index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCard(String imageurl, double width, double height,
      String candidateName, String description, String lien) {
    return Container(
      padding: EdgeInsets.fromLTRB(height / 30, 0, height / 30, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 30),
        color: Colors.white,
      ),
      width: width / 5,
      height: height / 3,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: height / 25),
              Row(
                children: [
                  SizedBox(width: width / 70),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageurl,
                      scale: 0.5,
                    ),
                    radius: height / 11,
                  ),
                  SizedBox(width: width / 20),
                  Column(
                    children: [
                      Center(child: Text(candidateName)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height / 30),
              Divider(
                color: Colors.black,
                height: height / 300,
                thickness: height / 300,
                indent: width / 60,
                endIndent: width / 25,
              ),
              SizedBox(height: height / 30),
              Row(
                children: [
                  SizedBox(width: width / 50),
                  Text(
                    "Description\n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: height / 6,
                child: Text(description),
              ),
              SizedBox(height: height / 20),
              Text("Lien vers ma présentation",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: height / 60),
              GestureDetector(
                child: Text(
                  lien,
                  style: new TextStyle(
                    color: Color.fromRGBO(1, 77, 152, 1),
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () => _launchURL(lien),
              ),
              SizedBox(height: height / 9),
              Container(
                width: width > 850 ? width / 7 : width / 3,
                height: height / 20,
                padding: EdgeInsets.only(
                  right: height / 20,
                  left: height / 20,
                ),
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Color.fromRGBO(255, 213, 0, 1),
                  child: Text(
                    "VOTER",
                    style: TextStyle(
                      color: Color.fromRGBO(1, 77, 152, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    var maliste = Provider.of<GetVotant>(context, listen: false)
                        .getUpdateVotant();
                    await isBlocked(maliste[0], maliste[1]);
                    int isblock =
                        Provider.of<CheckBlock>(context, listen: false)
                            .getBlockVotant();
                    if (isblock != 1) {
                      giveVote(candidateName);
                      blockVotant(maliste[0], maliste[1]);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessVote()));
                    } else if (isblock == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FailureVote()));
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
