import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingWidget extends StatelessWidget {
   SettingWidget({super.key,required this.icons, required this.title});
  IconData icons;
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icons,color: Colors.green,),
        SizedBox(width: 10,),
        Text(title, style: GoogleFonts.cairo(color: Colors.green),),
        SizedBox(width: 40,),
        Icon(FontAwesomeIcons.arrowRight, color: Colors.green,),
      ],
    );
  }
}