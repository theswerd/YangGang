import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#YANGGANG"), 
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Mdi.menu),
            
            itemBuilder: (i)=>[
              PopupMenuItem(
                value: "ads",
                child: Text('Get rid of ads'),
              ),
              PopupMenuItem(
                value: "donate",
                child: Text('Donate to Yang!'),
              ),
              PopupMenuItem(
                value: "info",
                child: Text('Extra Info'),
              ),
            ]   
          )
        ],
      ),
      body: Center(child: OutlineButton(
        child: Text("Play Sound"),
        onPressed: () async{
          AssetsAudioPlayer().open(AssetsAudio(
            asset: "Nato.mp3",
            folder: "assets/Audio",
          ));
        },
      )),
    );
  }
}