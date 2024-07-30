import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Ltext extends StatelessWidget {
  const Ltext({super.key, required this.color, required this.fw, required this.text});
  final Color color;
  final FontWeight fw;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: 25,
        fontWeight: fw,
        letterSpacing: 0.02,
      ),
    );
    
  }
}

Widget vitalsText(text, color) {
  return
  Text(
    text,
    style: GoogleFonts.montserrat(
        fontSize: 25, color: color, fontWeight: FontWeight.bold),
  );
}

Widget mText(text,color,fw){
  return
  Text(
    text,
    style: GoogleFonts.montserrat(
        fontSize: 20, color: color, fontWeight: fw),
  );
}