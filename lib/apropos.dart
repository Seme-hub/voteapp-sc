import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  @override
  InfoState createState() => InfoState();
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage("open-img.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              Column(
                children: [
                  Image.asset(
                    "semecity.png",
                    width: width / 6,
                    height: height / 6,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: height / 35,
                  ),
                  Text(
                    "SÈMÈVOTE est la plateforme officielle de vote des  ambassadeurs de Sèmè City. Tu y trouveras toutes les informations  nécessaires pour",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "comprendre ce  qu'est un.e Ambassadeur.drice à Sèmè City et prendre part à la campagne si tu penses avoir des atouts.                              ",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: width / 4),
                      Text(
                        "Télécharge ici, le document",
                        style: GoogleFonts.openSans(
                            fontSize: height / 38, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                        onPressed: () {
                          _launchURL(
                              "https://firebasestorage.googleapis.com/v0/b/voteapp-199d2.appspot.com/o/devenir%20ambassadeur%20c'est%20quoi.docx?alt=media&token=e0318024-430f-409b-acdb-040b8ed3c984");
                        },
                        child: Text(
                          "Un.e Ambassadeur.drice à Sèmè City, c'est quoi ?",
                          style: GoogleFonts.openSans(
                              fontSize: height / 38,
                              fontWeight: FontWeight.w600),
                        ),
                        minWidth: width / 8,
                        textColor: Color.fromRGBO(11, 35, 111, 1),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: width / 4),
                      Text(
                        "Télécharge ici, le",
                        style: GoogleFonts.openSans(
                            fontSize: height / 38, fontWeight: FontWeight.w600),
                      ),
                      FlatButton(
                        onPressed: () {
                          _launchURL(
                              "https://firebasestorage.googleapis.com/v0/b/voteapp-199d2.appspot.com/o/R%C3%A8glement%20de%20campagne.docx?alt=media&token=a6866968-e163-4446-b471-f02107387d5e");
                        },
                        child: Text(
                          "règlement de campagne",
                          style: GoogleFonts.openSans(
                              fontSize: height / 38,
                              fontWeight: FontWeight.w600),
                        ),
                        minWidth: width / 8,
                        textColor: Color.fromRGBO(11, 35, 111, 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Text(
                    "Tu as pris connaissance du profil idéal de l'Ambassadeur.drice, tu connais la procédure à suivre pour être candidat.e, tu penses avoir les",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "atouts et être un.e candidat.e redoutable, tu t'es inscrit.e sur la liste des candidats... Tu devras maintenant mettre toutes les chances de",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "de ton côté pour être élue.e.                                                                                                                                                                                                       ",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height / 35,
                  ),
                  Text(
                    "Faire  campagne est  une pratique recommandée  durant ces élections, il  s'agit d'une  occasion  de  convaincre  les électeurs que tu es la",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "meilleure personne pour les représenter en tant qu'Ambassadeur. Une campagne électorale implique généralement de discuter avec les",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "membres  de  l'écosystème  c'est-à-dire  tes  camarades  de  promo  mais  aussi  les autres personnes qui cohabitent  au  sein du campus,",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "d'assurer une présence sur les médias sociaux, et possiblement, de participer à une tribune réunissant l'ensemble des candidats.               ",
                    style: GoogleFonts.openSans(
                        fontSize: height / 38, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          )
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
