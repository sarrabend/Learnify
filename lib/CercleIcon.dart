import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class CercleIcon extends StatelessWidget {
  CercleIcon();
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(Cercle),
    );
  }
}