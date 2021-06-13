
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonInfo.dart';
import 'package:somthn/Buttons/buttonMusic.dart';
import 'package:somthn/Buttons/buttonSound.dart';
import 'package:somthn/Buttons/buttonUserSettings.dart';
import 'package:somthn/WelcomePages/Voila.dart';
import 'package:somthn/modification/Userinfo.dart';
import '../Buttons/BacksButton.dart';
import '../Buttons/butttonExit.dart';
import 'Home.dart';
import '../Services/auth.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


class SettingsH extends StatefulWidget {
  AudioPlayer value = new AudioPlayer();
  SettingsH ({this.value});
  @override
  _SettingsHState createState() => _SettingsHState();
}

class _SettingsHState extends State<SettingsH> {
  AudioPlayer value = new AudioPlayer();
  _SettingsHState({this.value});

  @override
  Widget build(BuildContext context) {
    bool noSound=false;
    bool noMusic=false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        height: size.height,
        width: size.width,
        child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/forestbackground.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.5,
                  left:size.width*0.6,
                  child:MusicButton(onPressed: () async {
                    AudioPlayer advancedPlayer;
                    int result = await advancedPlayer.pause();
                  })
              ),
              if(noMusic)
                Positioned(
                    top: size.height*0.5,
                    left:size.width*0.6,
                    child:IconButton(
                      icon: SvgPicture.asset('assets/icons/noMusic.svg'),
                      iconSize: 90,
                      onPressed:(){
                      },)
                ),
              Positioned(
                  top: size.height*0.5,
                  right:size.width*0.6,
                  child:SoundButton(onPressed:(){
                  },)
              ),
              if(noSound)
                Positioned(
                    top: size.height*0.5,
                    right:size.width*0.6,
                    child:IconButton(
                      icon: SvgPicture.asset('assets/icons/noSound.svg'),
                      iconSize: 90,
                      onPressed:(){
                      },)
                ),
              Positioned(
                  top: size.height*0.047,
                  left: size.width*0.39,
                  child:HomeButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Voila()),);
                  })
              ),

              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child:BacksButton(onPressed:() {
                    Navigator.pop(context);
                  },
                  )

              ),
              Positioned(
                  top: size.height*0.04,
                  left:size.width*0.75,
                  child:InfoButton(onPressed:() {
                  })
              ),

            ]
        ),
      ),
    );
  }
}


