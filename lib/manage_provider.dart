import 'package:flutter/material.dart';

class CheckVotant extends ChangeNotifier {
  int isVotant = 0;

  int getUpdateVotant() {
    return isVotant;
  }

  updateVotant({int b}) {
    isVotant = b;
    notifyListeners();
  }
}

class CheckBlock extends ChangeNotifier {
  int isBlock = 0;

  int getBlockVotant() {
    return isBlock;
  }

  updateBlockVotant({int b}) {
    isBlock = b;
    notifyListeners();
  }
}

class GetVotant extends ChangeNotifier {
  var maliste = List();

  List getUpdateVotant() {
    return maliste;
  }

  updateVotant({var liste}) {
    maliste = liste;
    notifyListeners();
  }
}

class CandidateInfo extends ChangeNotifier {
  var liste = List();

  List getUpdateCandidateInfo() {
    return liste;
  }

  updateCandidateInfo({var laliste}) {
    liste = laliste;
    notifyListeners();
  }
}

class AllCandidates extends ChangeNotifier {
  var liste = List();

  List getUpdateCandidateList() {
    return liste;
  }

  updateCandidateList({var laliste}) {
    liste = laliste;
    notifyListeners();
  }
}

class AllVotes extends ChangeNotifier {
  var liste = List();

  List getUpdateVote() {
    return liste;
  }

  updateVote({var laliste}) {
    liste = laliste;
    notifyListeners();
  }
}

class GetOccur extends ChangeNotifier {
  var liste = List();

  List getUpdateOccurList() {
    return liste;
  }

  updateOccurList({var laliste}) {
    liste = laliste;
    notifyListeners();
  }
}

class GetMap extends ChangeNotifier {
  var mymap = Map();

  Map getUpdateMap() {
    return mymap;
  }

  updateMap({var lamap}) {
    mymap = lamap;
    notifyListeners();
  }
}

class Getlink extends ChangeNotifier {
  String link = "";

  String getUpdateLink() {
    return link;
  }

  updateLink({String e}) {
    link = e;
    notifyListeners();
  }
}
