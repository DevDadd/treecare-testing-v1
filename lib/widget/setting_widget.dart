import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: GoogleFonts.cairo()),
        SizedBox(width: 40),
        Icon(FontAwesomeIcons.arrowRight),
      ],
    );
  }
}
