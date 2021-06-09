import 'dart:ui';
import 'constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialogBox extends StatefulWidget {

  bool validate;
  setTrue() {
    this.validate = true;
  }
  setFalse() {
    this.validate = false;
  }
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
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
                    child: Text(
                      'DUMP SHIT LOSING ALL YOUR PROGRESS',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Skranji-Bold',
                        fontWeight: FontWeight.bold,
                        color: Color(0xff693821),
                      ),
                      textAlign: TextAlign.center,
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
                    icon: SvgPicture.asset('assets/icons/non.svg')),
              ),
            ),


          ]
      ),
    );
  }
}
