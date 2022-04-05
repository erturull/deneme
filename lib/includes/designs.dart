import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDesigns {
  Widget assetImageBackground({
    required String path,
    bool web = false,
    bool finish = false,
  }) {
    return Builder(builder: (context) {
      Size mainSize = MediaQuery.of(context).size;
      double mobileHeigth = mainSize.height / 2.5;
      double mobileWidth = mainSize.width;
      double webHeigth = mainSize.height / 3;
      double webWidth = mainSize.width / 5;
      double finishHeight = mainSize.height / 1.5;
      return SizedBox(
        height: finish == true
            ? finishHeight
            : web == false
                ? mobileHeigth
                : webHeigth,
        width: web == false ? mobileWidth : webWidth,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 40,
              child: Opacity(
                opacity: 0.322,
                child: CircleAvatar(
                  radius: 108.86,
                  backgroundColor: Colors.green.shade300,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 70,
              child: Opacity(
                opacity: 0.322,
                child: CircleAvatar(
                  radius: 67.62,
                  backgroundColor: Colors.blue.shade300,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 60,
              child: Opacity(
                opacity: 0.322,
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.pink.shade300,
                ),
              ),
            ),
            Center(
              child: Image.asset(path),
            ),
          ],
        ),
      );
    });
  }

  Widget opacityCircle({
    required Color color,
    double opacity = 0.4,
    Widget? content,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: opacity,
          child: CircleAvatar(
            backgroundColor: color,
          ),
        ),
        content ?? Container(),
      ],
    );
  }

  Widget speakBaloon({
    required String text,
    double height = 250,
    double width = 200,
    bool image = false,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(150),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(text.length < 20 ? 40 : 8),
                  child: image == true
                      ? Image.asset(
                          text,
                          width: 80,
                        )
                      : Text(
                          text,
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ),
          const Positioned(
            right: 20,
            top: 80,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            right: 0,
            top: 100,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
