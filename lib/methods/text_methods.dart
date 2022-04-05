import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMethods {
  Widget headText(
      {required String text,
      TextAlign textAlign = TextAlign.start,
      double fontSize = 32}) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.indieFlower(
          fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }

  Widget standartText(
      {required String text,
      FontWeight fontWeigth = FontWeight.normal,
      TextAlign textAlign = TextAlign.start}) {
    return Text(
      text,
      style: GoogleFonts.roboto(fontSize: 18, fontWeight: fontWeigth),
      textAlign: textAlign,
    );
  }

  Widget inputNextButton({required Function() onTap}) {
    return Bounceable(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Devam Et',
            style: GoogleFonts.indieFlower(fontSize: 32, color: Colors.grey),
          ),
          const Icon(
            Icons.arrow_forward,
            size: 30,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget inputBackButton({required Function() onTap}) {
    return Bounceable(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.grey,
          ),
          Text(
            'Geri Dön',
            style: GoogleFonts.indieFlower(fontSize: 32, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
