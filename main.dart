
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreeState createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {

  late YoutubePlayerController youtubePlayerController;
  TextEditingController youtubeLink = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: "",
        flags: YoutubePlayerFlags(
          mute: true,
          startAt: 0
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayer(
            controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            progressColors: ProgressBarColors(
                handleColor: Colors.red,
                playedColor: Colors.red
            ),
            progressIndicatorColor: Colors.red,
          ),
          TextFormField(
            controller: youtubeLink,
            decoration: InputDecoration(
              hintText: "Paste youtube link"
            ),
          ),
          MaterialButton(
            onPressed: (){
              youtubePlayerController.load(YoutubePlayer.convertUrlToId(youtubeLink.text) ?? "");
            },
          child: Text("Load"),
          minWidth: MediaQuery.of(context).size.width,
          color: Colors.red,)
        ],
      )
    );
  }
}
