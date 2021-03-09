import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voteapp/addCandidate_page.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:provider/provider.dart';
import 'package:voteapp/statistics.dart';
import 'package:voteapp/add_image.dart';

class AdminPage extends StatefulWidget {
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  Future<void> getAllCands() async {
    CollectionReference candidats =
        FirebaseFirestore.instance.collection("Candidats");
    var allCand = List();

    return candidats.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            var _liste = [];
            _liste.add(doc["name"]);
            allCand.add(_liste);
          }),
          Provider.of<AllCandidates>(context, listen: false)
              .updateCandidateList(laliste: allCand),
        });
  }

  Future<void> getVotes() async {
    CollectionReference candidats =
        FirebaseFirestore.instance.collection("Votes");
    var total = List();

    return candidats.get().then((QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach((doc) {
            total.add(doc["candidate"]);
          }),
          Provider.of<AllVotes>(context, listen: false)
              .updateVote(laliste: total),
        });
  }

  Future<void> counter() async {
    await getAllCands();
    await getVotes();
    int count = 0;
    var allCands = [];
    var allVot = [];
    var mymap = Map<String, double>();

    allCands = Provider.of<AllCandidates>(context, listen: false)
        .getUpdateCandidateList();
    allVot = Provider.of<AllVotes>(context, listen: false).getUpdateVote();

    for (int i = 0; i < allCands.length; i++) {
      for (int j = 0; j < allVot.length; j++) {
        if (allCands[i][0] == allVot[j]) count++;
      }
      allCands[i].add(count.toString());
      count = 0;
    }
    for (int i = 0; i < allCands.length; i++) {
      mymap[allCands[i][0]] = double.parse(allCands[i][1]);
    }
    Provider.of<GetMap>(context, listen: false).updateMap(lamap: mymap);
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var mymap = Map();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Image.asset(
                "semecity2.png",
                width: width / 9,
                height: height / 19,
                alignment: Alignment.bottomLeft,
              ),
              SizedBox(width: width / 1.45),
            ],
          ),
        ),
        backgroundColor: Colors.white10,
      ),
      body: PageView(
        allowImplicitScrolling: true,
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("statistiques1.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  Image.asset(
                    "semecity.png",
                    width: width / 8,
                    height: height / 7,
                  ),
                  SizedBox(height: height / 30),
                  Text(
                    "Bienvenue sur la page d'administration",
                    style: GoogleFonts.acme(
                      fontSize: height / 25,
                      color: Color.fromRGBO(11, 35, 111, 1),
                    ),
                  ),
                  SizedBox(height: height / 12),
                  Container(
                    width: width > 1100
                        ? width / 6
                        : (width > 750 ? width / 4.2 : width / 2.6),
                    height: height / 15,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(255, 213, 0, 1),
                      textColor: Colors.white,
                      child: Text(
                        "Ajouter un candidat",
                        style: TextStyle(
                          fontSize: height / 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(11, 35, 111, 1),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddImage()));
                      },
                    ),
                  ),
                  SizedBox(height: height / 20),
                  Container(
                    width: width > 1100
                        ? width / 6
                        : (width > 750 ? width / 4.2 : width / 2.6),
                    height: height / 15,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(255, 213, 0, 1),
                      textColor: Colors.white,
                      child: Text(
                        "Voir les résultats",
                        style: TextStyle(
                          fontSize: height / 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(11, 35, 111, 1),
                        ),
                      ),
                      onPressed: () async {
                        await counter();
                        mymap = Provider.of<GetMap>(context, listen: false)
                            .getUpdateMap();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatisticsPage(mymap)));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
