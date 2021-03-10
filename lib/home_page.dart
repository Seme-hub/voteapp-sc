import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voteapp/apropos.dart';
import 'package:voteapp/connexionPage.dart';
import 'package:voteapp/adminconnexionPage.dart';
import 'package:voteapp/add_image.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          width: width,
          height: height,
          child: Row(
            children: [
              Image.asset(
                "semecity.png",
                width: width / 9,
                height: height / 11,
                alignment: Alignment.bottomLeft,
              ),
              SizedBox(width: width / 35),
              Container(
                width: width / 4.3,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddImage()));
                  },
                  child: Text(
                    "S'inscrire",
                    style: GoogleFonts.openSans(
                      fontSize: width > 760 ? height / 46 : height / 56,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textColor: Color.fromRGBO(11, 35, 111, 1),
                ),
              ),
              Text(
                "|",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 35, 111, 1),
                ),
              ),
              Container(
                width: width / 3.8,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminConnexionPage()));
                  },
                  child: Text(
                    "Administrer",
                    style: GoogleFonts.openSans(
                      fontSize: width > 760 ? height / 46 : height / 56,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  minWidth: width / 8,
                  textColor: Color.fromRGBO(11, 35, 111, 1),
                ),
              ),
              Text(
                "|",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(11, 35, 111, 1),
                ),
              ),
              Container(
                width: width / 4.3,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Info()));
                  },
                  child: Text(
                    "À propos",
                    style: GoogleFonts.openSans(
                      fontSize: width > 800 ? height / 46 : height / 56,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textColor: Color.fromRGBO(11, 35, 111, 1),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white10,
      ),
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
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("semecity.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 30),
                  Image.asset(
                    "semecity.png",
                    width: width / 7,
                    height: height / 6,
                  ),
                  SizedBox(height: height / 45),
                  Text(
                    'ÊTES-VOUS NOTRE FUTUR.E AMBASSADEUR.DRICE ? ',
                    style: GoogleFonts.openSans(
                      fontSize: height / 28,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: height / 35),
                  Text(
                    "Sèmè City est à la recherche d\'étudiants dynamiques, engagés, créatifs, bons communicateurs et qui",
                    style: GoogleFonts.openSans(
                      fontSize: height / 32,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "souhaitent contribuer au rayonnement de leur écosystème en tant qu'ambassadeurs.drices.",
                    style: GoogleFonts.openSans(
                      fontSize: height / 32,
                      color: Color.fromRGBO(11, 35, 111, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height / 15),
                  Container(
                    width: width > 1100
                        ? width / 6.1
                        : (width > 690 ? width / 4.8 : width / 2.4),
                    height: height / 15,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(255, 213, 0, 1),
                      textColor: Colors.white,
                      child: Text(
                        "Démarrer",
                        style: TextStyle(
                          fontSize: height / 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(11, 35, 111, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConnexionPage()));
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
