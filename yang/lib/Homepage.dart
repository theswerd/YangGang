import 'dart:math';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_audio_player/flutter_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:share/share.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  String ourWebsite = "TODO:GETWEBSITE";
  List shareStrings = [
    "Are you a fan of the #YANGGANG, then checkout #YANGGANG -- ",
    "Bro do you like Andrew Yang and making sounds, then you'll love #YANGGANG -- ",
    "Bro do you like making sounds and Andrew Yang, then you'll love #YANGGANG -- ",
    "Did you know Andrew Yang was born in 1975 -- #YANGGANG -- ",
    "Andrew Yang's Birthday is January 13 -- #YANGGANG -- ",
    "USA -- #YANGGANG -- ",
    "The Obama Administration named Andrew Yang “Champion of Change” -- #YANGGANG -- ",
    "Bro Andrew Yang is a democrat -- #YANGGANG -- ",
    "Did you know Andrew Yang is not a republican -- #YANGGANG -- ",
    "Andrew Yang was born in New York -- #YANGGANG -- ",
    "Andrew Yang is not six feet tall -- #YANGGANG -- ",
    "Andrew Yang went to Brown Univesty and Columbia Law School -- #YANGGANG -- ",
    "Andrew Yang's favorite actress is Emma Watson -- #YANGGANG -- ",
    "Andrew Yang's favorite actress is Emma Watson -- #YANGGANG -- ",
    "Andrew Yang Supports Medicare For All -- #YANGGANG -- "

  ];

  List<SoundButtonData> allSounds = [
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
    SoundButtonData("Greatest economic transition", "GreatestEconomicTransitionInOurCountriesHistory.mp3"),
    SoundButtonData("About me", "IFYouveHeardAnythingAboutMe.mp3"),
    SoundButtonData("Entrepreneur", "ImAnEntrupreneur.mp3"),
    SoundButtonData("Its gonna be AI", "InAFewYearsItsGonnaBeAnAI.mp3"),
    SoundButtonData("M.A.T.H", "M.A.T.H.mp3"),
    SoundButtonData("My wife", "MyWifeEvelyn.mp3"),
    SoundButtonData("NATO", "Nato.mp3"),
    SoundButtonData("Partnerships and alliances", "OuPartnershipsAndAlliances.mp3"),
    SoundButtonData("Payed family leave", "PayedFamilyLeave.mp3"),
    SoundButtonData("The American people", "TheAmericanPeople.mp3"),
    SoundButtonData("Meddling in American elections", "TheDaysOfMeddlingInAmericanElectionsAreOver.mp3"),
    SoundButtonData("The opposite of Trump", "TheOppositeOfDonaldTrump.mp3"),
    SoundButtonData("Things have changed", "ThingsHaveChangedFundamentally.mp3"),
    SoundButtonData("Climate change", "ClimateChange.mp3"),
    SoundButtonData("Donald Trump", "DonaldTrump.mp3"),
    SoundButtonData("Friends and allies", "FriendsAndAlliesWithUsInTheMission.mp3"),
    SoundButtonData("Solve those problems", "SolveThoseProblems.mp3"),
    SoundButtonData("War with Iran", "WarWithIran.mp3")
  ];
  List<SoundButtonData> randomSounds = [
    SoundButtonData("4th industrial revolution", '4thIndustrialRevolution.mp3'),
    SoundButtonData("Paths forward", "CreatePathsForward.mp3"),
    SoundButtonData("DOJ", "DepartmentOfJustice.mp3"),
    SoundButtonData("Boba", "AlmondMilkTeaWithBoba.mp3"),
    SoundButtonData("Delicious Tofu", "DeliciousLookingTofu.mp3"),
    SoundButtonData("7-Eleven", "GoInto7-11.mp3"),
    SoundButtonData("Stick Myself", "GonnaStickMyselfOneOfThese.mp3"),
    SoundButtonData("Really?", "OhReally,That'sNice.mp3"),
    SoundButtonData("That's For Me", "That'sForMe.mp3"),
    SoundButtonData("F*ucked", "YouAreGettingF-cked.mp3"),
    SoundButtonData("About me", "IFYouveHeardAnythingAboutMe.mp3"),
    SoundButtonData("Its gonna be AI", "InAFewYearsItsGonnaBeAnAI.mp3"),
    SoundButtonData("My wife", "MyWifeEvelyn.mp3"),
    SoundButtonData("NATO", "Nato.mp3"),
    SoundButtonData("Payed family leave", "PayedFamilyLeave.mp3"),
    SoundButtonData("Things have changed", "ThingsHaveChangedFundamentally.mp3"),
    SoundButtonData("Friends and allies", "FriendsAndAlliesWithUsInTheMission.mp3"),
    SoundButtonData("Solve those problems", "SolveThoseProblems.mp3"),
    SoundButtonData("War with Iran", "WarWithIran.mp3")
  ];
  List<SoundButtonData> positions = [
    SoundButtonData("Data is the new oil", "DataIsTheNewOil.mp3"),
    SoundButtonData("DOJ", "DepartmentOfJustice.mp3"),
    SoundButtonData("Education", "Education.mp3"),
    SoundButtonData("About me", "IFYouveHeardAnythingAboutMe.mp3"),
    SoundButtonData("Entrepreneur", "ImAnEntrupreneur.mp3"),
    SoundButtonData("Its gonna be AI", "InAFewYearsItsGonnaBeAnAI.mp3"),
    SoundButtonData("NATO", "Nato.mp3"),
    SoundButtonData("Partnerships and alliances", "OuPartnershipsAndAlliances.mp3"),
    SoundButtonData("Payed family leave", "PayedFamilyLeave.mp3"),
    SoundButtonData("The American people", "TheAmericanPeople.mp3"),
    SoundButtonData("Meddling in American elections", "TheDaysOfMeddlingInAmericanElectionsAreOver.mp3"),
    SoundButtonData("The opposite of Trump", "TheOppositeOfDonaldTrump.mp3"),
    SoundButtonData("Things have changed", "ThingsHaveChangedFundamentally.mp3"),
    SoundButtonData("Climate change", "ClimateChange.mp3"),
    SoundButtonData("Donald Trump", "DonaldTrump.mp3"),
  ];
  List<SoundButtonData> quotes = [
    SoundButtonData("Paths forward", "CreatePathsForward.mp3"),
    SoundButtonData("Education", "Education.mp3"),
    SoundButtonData("Greatest economic transition", "GreatestEconomicTransitionInOurCountriesHistory.mp3"),
    SoundButtonData("About me", "IFYouveHeardAnythingAboutMe.mp3"),
    SoundButtonData("Entrepreneur", "ImAnEntrupreneur.mp3"),
    SoundButtonData("Its gonna be AI", "InAFewYearsItsGonnaBeAnAI.mp3"),
    SoundButtonData("M.A.T.H", "M.A.T.H.mp3"),
    SoundButtonData("Payed family leave", "PayedFamilyLeave.mp3"),
    SoundButtonData("Meddling in American elections", "TheDaysOfMeddlingInAmericanElectionsAreOver.mp3"),
    SoundButtonData("The opposite of Trump", "TheOppositeOfDonaldTrump.mp3"),
    SoundButtonData("Things have changed", "ThingsHaveChangedFundamentally.mp3"),
  ];
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['andrew yang', 'yang', 'democract', 'millenial', 'political'],
    childDirected: false,
  );
  BannerAd myBanner;

  TabController tabController;

  @override
  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      }
    );

    tabController = new TabController(
      length: 4,
      vsync: this
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
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Mdi.menu),
              onSelected: (v){
                if(v == "share"){
                  Random random = new Random(DateTime.now().microsecondsSinceEpoch);
                  int index = random.nextInt(shareStrings.length-1);
                  Share.share(shareStrings[index]+ourWebsite);
                }

              },
              itemBuilder: (i)=>[
                PopupMenuItem(
                  child: Text("Get rid of ads"),
                ),
                PopupMenuItem(
                  child: Text("Donate to Yang"),
                ),
                PopupMenuItem(
                  child: Text("Share"),
                  value: "share",
                ),
                PopupMenuItem(
                  child: Text("Extra Info"),
                )
              ],
            )
          ],
        ),
        body: Scaffold(
          appBar: TabBar(
            controller: tabController,
            isScrollable: false,
            tabs: <Widget>[
              Tab(
                text: "All",
              ),
              Tab(
                text: "Quotes",
              ),
              Tab(
                text: "Positions",
              ),
              Tab(
                text: "Random",
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(
                controller: tabController,
                children: <Widget>[
                  buildSoundGridView(allSounds),
                  buildSoundGridView(quotes),
                  buildSoundGridView(positions),
                  buildSoundGridView(randomSounds)
                ],
              ),
              Positioned(
                bottom: 95,
                right: 20,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.redAccent[400],
                  label: Text("Play random"),
                  icon: Icon(Mdi.play),
                  onPressed: (){
                    Random random = new Random(DateTime.now().microsecond);
                    int newRandom = random.nextInt(allSounds.length-1);
                    SoundPlayerUtil.addSoundName(allSounds[newRandom].soundName);
                  },
                ),
              )
            ],
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

  GridView buildSoundGridView(List<SoundButtonData> list) {
    return GridView.builder(
              itemCount: list.length,
              padding: EdgeInsets.all(25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25
              ),
              itemBuilder: (c,i)=>RaisedButton(
                
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                elevation: 15,
                child: Center(child: Text(list[i].title, textScaleFactor: 1.5, textAlign: TextAlign.center,)),
                onPressed: (){
                  SoundPlayerUtil.addSoundName(
                    list[i].soundName
                  );
                },
              ),
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
