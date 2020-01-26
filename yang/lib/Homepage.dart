import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<SoundButtonData> sounds = [
    SoundButtonData("4th industrial revolution", '4thIndustrialRevolution.mp3'),
    SoundButtonData("Paths forward", "CreatePathsForward.mp3"),
    SoundButtonData("Data is the new oil", "DataIsTheNewOil.mp3"),
    SoundButtonData("DOJ", "DepartmentOfJustice.mp3"),
    SoundButtonData("Education", "Education.mp3"),
    SoundButtonData("Boba", "AlmondMilkTeaWithBoba.mp3"),
    SoundButtonData("Delicious Tofu", "DeliciousLookingTofu.mp3"),
    SoundButtonData("7-Eleven", "GoInto7-11.mp3"),
    SoundButtonData("Stick Myself", "GonnaStickMyselfOneOfThese.mp3"),
    SoundButtonData("Really?", "OhReally,That'sNice.mp3"),
    SoundButtonData("That's For Me", "That'sForMe.mp3"),
    SoundButtonData("F*ucked", "YouAreGettingF-cked.mp3"),
  ];
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['andrew yang', 'yang', 'democract', 'millenial'],
      childDirected: false,
    );
    BannerAd myBanner;
  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
    myBanner..load()..show(
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
      anchorType: AnchorType.bottom,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('#YANGGANG'),
        ),
        body: GridView.builder(
          itemCount: sounds.length,
          padding: EdgeInsets.all(25),
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25
          ),
          itemBuilder: (c,i)=>RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 15,
            child: Center(child: Text(sounds[i].title, textScaleFactor: 1.5, textAlign: TextAlign.center,)),
            onPressed: (){
              SoundPlayerUtil.addSoundName(
                sounds[i].soundName
              );
            },
          ),
        ),
        // body: Center(
        //     child: Column(
        //   children: <Widget>[
        //     RawMaterialButton(
        //       child: Text('network disconnect'),
        //       onPressed: () => SoundPlayerUtil.addSoundName(
        //           'Nato.mp3',
        //           count: 1),
        //     ),
        //     RawMaterialButton(
        //       child: Text('printer disconnect'),
        //       onPressed: () => SoundPlayerUtil.addSoundName(
        //           'printer_disconnect.m4a',
        //           count: 3),
        //     ),
        //     RawMaterialButton(
        //       child: Text('remove all'),
        //       onPressed: () => SoundPlayerUtil.removeAllSound(),
        //     ),
        //   ],
        // )),
      );
    
  }
}

class SoundButtonData {
  String title;
  String soundName;
  SoundButtonData(
    this.title,
    this.soundName
  );
}

class SoundPlayerUtil {
  static void addSoundName(String name) {
    AudioPlayer.addSound('assets/Audio/' + name);
  }

  static void removeAllSound() {
    AudioPlayer.removeAllSound();
  }
}
