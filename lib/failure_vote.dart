import 'package:flutter/material.dart';

class FailureVote extends StatefulWidget {
  @override
  FailureVoteState createState() => FailureVoteState();
}

class FailureVoteState extends State<FailureVote> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height / 6.4,
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
                    fontSize: height / 35,
                    color: Color.fromRGBO(1, 77, 152, 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height / 30),
          Container(
            width: width,
            height: height - (height / 30) - (height / 6.4),
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
                Center(
                  heightFactor: 1.6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height / 30),
                      color: Color.fromRGBO(11, 35, 111, 1),
                    ),
                    width: width > 900
                        ? width / 4
                        : (width > 700 ? width / 3 : width / 2),
                    height: height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          size: height / 8,
                          color: Color.fromRGBO(249, 193, 6, 1),
                        ),
                        SizedBox(height: height / 40),
                        Text(
                          "Vous ne pouvez voter qu'une fois !",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: height / 45),
                        Text(
                          "Votre vote a déjà été pris en compte",
                          style: TextStyle(
                              color: Colors.white, fontSize: height / 45),
                        ),
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
