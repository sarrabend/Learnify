import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class Cercle2Icon extends StatelessWidget {
  Cercle2Icon();
  //final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(Cercle2),
    );
  }
}