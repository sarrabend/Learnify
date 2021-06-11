import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Maths/M-1.dart';

class customDialogLock extends StatelessWidget {
  const customDialogLock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  child: SvgPicture.asset('assets/icons/dialogB.svg')),
            ),
            Positioned(
                top: size.height * 0.05,
                left: size.width * 0.1,
                child: Container(
                  child: SizedBox(
                    height: size.height * 0.15,
                    width: size.height * 0.3,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Tu as atteint 1heure de  \n jeu sans arret , l''application va \n se terminer , veux tu quitter maintenant ? \n sinon l''aplication s''arretera automatiquement dans 5 minutes ! \n pense a terminer un niveau pendant c' ,
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Skranji-Bold',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff693821),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
            ),
            Positioned(
              top: size.height * 0.25,
              left: size.width * 0.1,
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.3,
                child: IconButton(
                  icon: SvgPicture.asset('assets/icons/oui.svg'),
                  onPressed: () {
                    SystemNavigator.pop();
                  },),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              right: size.width * 0.1,
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.3,
                child: IconButton(
                    onPressed: () {
                    Timer(Duration(minutes : 5), (){
                      SystemNavigator.pop();
                    });//timer
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset('assets/icons/non.svg')),
              ),
            ),


          ]
      ),
    );
  }
}