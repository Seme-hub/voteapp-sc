import 'package:flutter/material.dart';
import 'package:voteapp/manage_provider.dart';
import 'package:provider/provider.dart';
import 'package:voteapp/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckVotant()),
        ChangeNotifierProvider(create: (context) => GetVotant()),
        ChangeNotifierProvider(create: (context) => CheckBlock()),
        ChangeNotifierProvider(create: (context) => CandidateInfo()),
        ChangeNotifierProvider(create: (context) => AllCandidates()),
        ChangeNotifierProvider(create: (context) => GetOccur()),
        ChangeNotifierProvider(create: (context) => AllVotes()),
        ChangeNotifierProvider(create: (context) => GetMap()),
        ChangeNotifierProvider(create: (context) => Getlink()),
      ],
      child: MaterialApp(
        color: Colors.red,
        title: 'SEMEVOTE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
