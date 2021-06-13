import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Geographie/Niv3Pass%C3%A9.dart';
import 'package:somthn/Geographie/N3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:vibration/vibration.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'package:somthn/Geographie/BienvenueGeo.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'BienvenueGeo.dart';
import 'package:somthn/Geographie/boxDialogGeo3.dart';

import '../Maths/ScoreMaths.dart';
import'../Francais/ScoreFr.dart';
import'../Maths/HighestScore.dart';

ScoreMaths scorM;
ScoreFr scorF ;
HighestScore highM , highF;


class N3Q5T2_C_4 extends StatefulWidget {
  const N3Q5T2_C_4({Key key}) : super(key: key);

  @override
  _N3Q5T2_C_4State createState() => _N3Q5T2_C_4State();
}

class _N3Q5T2_C_4State extends State<N3Q5T2_C_4> {
  var player = AudioCache();
  var player2 = AudioPlayer ();
  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsMauvRep.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  bool Visible = true;
  bool correct = false;
  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        child: Scaffold(
          body:
          Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogGeo3();
                        }
                    );
                    player2.stop();

                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(ThreeBars)),
              Positioned(
                bottom: size.height*0.57,
                left: size.width*0.05,
                height: size.height*0.3,
                width: size.width*0.6,
                child:SvgPicture.asset('assets/icons/BulleN3Q5T2.svg'),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars),
                ),
              ),

              /*Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.468,
                  left: size.width*0.7,
                  child: IconButton(
                    iconSize: 64,
                    icon: SvgPicture.asset('assets/icons/QuestionMark.svg'),
                    onPressed: (){
                      print('QuestionMark');
                      player.play('audio/geomonnaie.wav');
                    },
                  ),
                ),
              ),*/

              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.35,
                    left: size.width*0.66,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.34,
                    left: size.width*0.62,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.353,
                    left: size.width*0.645,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.348,
                    left: size.width*0.645,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.71,
                  left: size.width*0.3,
                  child: IconButton(
                    iconSize: 64,
                    icon: SvgPicture.asset('assets/icons/AudioIcon.svg'),
                    onPressed: () async {
                      print('playAudio3');
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      player2 =  await player.play('audio/singapouroff.wav');},
                  ),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.61,
                  left: size.width*0.75,
                  child: IconButton(
                    iconSize: 64,
                    icon: SvgPicture.asset('assets/icons/AudioIcon.svg'),
                    onPressed: () async {
                      print('playAudio2');
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      player2 =  await player.play('audio/algeriaoff.wav');},
                  ),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.51,
                  left: size.width*0.3,
                  child: IconButton(
                    iconSize: 64,
                    icon: SvgPicture.asset('assets/icons/AudioIcon.svg'),
                    onPressed: () async {
                      print('playAudio1');
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      player2 =  await player.play('audio/braziloff.wav');},
                  ),
                ),
              ),


              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0.55,
                  child: IconButton(
                    iconSize: 80,
                    icon: SvgPicture.asset('assets/icons/Audio2.svg'),
                    onPressed: (){
                      print('mermorte');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                  ),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  left: size.width*0.1,
                  child: IconButton(
                    iconSize: 80,
                    icon: SvgPicture.asset('assets/icons/Audio3.svg'),
                    onPressed: (){
                      print('meditera');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                      });},
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.5,
                  left: size.width*0.1,
                  child: IconButton(
                    iconSize: 80,
                    icon: SvgPicture.asset('assets/icons/Audio1.svg'),
                    onPressed: (){
                      print('merNoire');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                      });},
                  ),

                ),
              ),

              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: () async {
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      print("score final");
                      print(scoreG.niv3);
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').updateData({'niv3':scoreG.niv3});
                      if (scoreG.niv3>highG.niv3)
                      { highG.niv3=scoreG.niv3 ;
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').updateData({'high3':scoreG.niv3});}
                      // infos maths
                      var dm=await  Firestore.instance.collection('users').document(user.uid).collection('domains').document('maths').get();
                      scorM =new ScoreMaths(dm.data["testFait"], dm.data["niv1"], dm.data["niv2"], dm.data["niv3"]);
                      highM =new HighestScore(dm.data["high1"],dm.data["high2"],dm.data["high3"]);
                      //infos fr
                      var df=await Firestore.instance.collection('users').document(user.uid).collection('domains').document('francais').get();
                      scorF =new ScoreFr(df.data["testFait"], df.data["niv1"], df.data["niv2"], df.data["niv3"]);
                      highF =new HighestScore(df.data["high1"],df.data["high2"],df.data["high3"]);
                      int score=scorM.somme()+scorF.somme() +scoreG.somme() ;
                      int high=highM.somme()+highF.somme() +highG.somme() ;
                      var doc=await Firestore.instance.collection('users').document(user.uid).get();
                      if (doc.data['finalScore']<high){
                        Firestore.instance.collection('users').document(user.uid).updateData({'finalScore':high});
                      }
                      Firestore.instance.collection('users').document(user.uid).updateData({'score':score});
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Niveau3Pass()));
                      print('Continuer');},)
                ),
              ),
              //Second click
              Positioned(
                  top: size.height*0.5,
                  left: size.width*0.1,
                  child: Visibility(
                      visible: (threeClicked && Visible),
                      child: IconButton(
                        iconSize:80,
                        onPressed: () async {
                          player2.stop();
                          int result = await advancedPlayer.pause();
                          //Vibration.vibrate();

                          if (threeClicked){
                            player2 =  await player.play('audio/losing.wav');
                            setState(() {
                              correct = false;
                              Visible = false;

                              print('Correct');
                            });
                            print('Oran');
                          }
                          print('Alger');
                        },
                        icon: SvgPicture.asset('assets/icons/Audio1.svg'),))
              ),
              Positioned(
                top: size.height*0.7,
                left: size.width*0.1,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        iconSize: 80,
                        onPressed: () async {
                          player2.stop();
                          int result = await advancedPlayer.pause();
                          if (fourClicked) {
                            //Vibration.vibrate();
                            player2 =  await player.play('audio/losing.wav');
                            setState(() {
                              correct = false;
                              Visible = false;

                              print('Correct');
                            });


                          }
                          print('Alger');
                        },
                        icon: SvgPicture.asset('assets/icons/Audio3.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.6,
                left: size.width*0.55,

                child: Visibility(
                    visible: (twoClicked&&Visible),
                    child: IconButton(
                        iconSize:80,
                        onPressed: () async {
                          player2.stop();
                          int result = await advancedPlayer.pause();
                          if (twoClicked) {
                            //Vibration.vibrate();
                            player2 =  await player.play('audio/mathsBravo.wav');

                            setState(() {
                              correct = true;
                              Visible = false;

                              print('Correct');
                              scoreG.niv3++ ;
                            });
                            print('Oran');
                          }
                        },
                        icon: SvgPicture.asset('assets/icons/Audio2.svg'))
                ),
              ),

              if (correct)
                Stack(
                  children: <Widget>[
                    Positioned(
                      top: size.height*0.57,
                      left: size.width*0.27,
                      child: Visibility(
                          visible: !Visible,
                          child: IconButton(
                              iconSize:80,
                              onPressed: (){
                                print('3aychin ghaya kho');
                              },
                              icon: SvgPicture.asset('assets/icons/Audio2.svg'))
                      ),
                    ),
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                        top: size.height*0.56,
                        left: size.width*0.45,
                        child: IconButton(
                          iconSize: 100,
                          icon: SvgPicture.asset('assets/icons/AudioIcon.svg'),
                          onPressed: (){
                            print('playAudio1');
                            setState(() {

                            });},
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !Visible,
                      child:Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Right)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/HappyPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/HappyOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/HappyBlue.gif'),
                        ),
                      ),
                    Visibility(
                      visible: !Visible,
                      child: Positioned(
                          height: size.width*0.45,
                          width: size.width*0.45,
                          left: size.width*0.4,
                          top:size.height*0.7,
                          child: SvgPicture.asset(bulleBravo)
                      ),
                    ),
                  ],
                ),
              if (!correct)
                Stack(
                  children:[
                    Visibility(
                      visible: !Visible,
                      child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Wrong)
                      ),
                    ),
                    if (user.avatar=="Pink")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadPink.gif'),
                        ),
                      ),
                    if (user.avatar=="Purple")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.35,
                          width: size.width*0.35,
                          left: size.width*0.1,
                          top:size.height*0.7,
                          child:Image.asset('images/MadPurple.gif'),
                        ),
                      ),
                    if (user.avatar=="Orange")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child: Image.asset('images/MadOrange.gif'),
                        ),
                      ),
                    if (user.avatar=="Blue")
                      Visibility(
                        visible: !Visible,
                        child: Positioned(
                          height: size.width*0.3,
                          width: size.width*0.3,
                          left: size.width*0.1,
                          top:size.height*0.729,
                          child:Image.asset('images/MadBlue.gif'),
                        ),
                      ),


                  ],
                ),
            ],
          ),
        ));
  }
}