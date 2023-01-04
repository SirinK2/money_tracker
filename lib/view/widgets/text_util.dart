import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const TextUtil({Key? key, required this.text, required this.fontSize, required this.fontWeight, required this.color, required this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.alef(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),


    );
  }
}
