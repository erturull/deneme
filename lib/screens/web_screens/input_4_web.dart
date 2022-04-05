import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_5.dart';

class Input4Web extends StatefulWidget {
  final double sigara;
  final double vakit;
  final double height;
  final double weight;
  const Input4Web(
      {Key? key,
      required this.sigara,
      required this.vakit,
      required this.height,
      required this.weight})
      : super(key: key);

  @override
  State<Input4Web> createState() => _Input4WebState();
}

class _Input4WebState extends State<Input4Web> {
  bool? social;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/logo.png',
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextMethods().headText(
                        text: 'Kendinizi sosyal olarak tanımlar mısınız?',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Bounceable(
                          onTap: () {
                            setState(() {
                              social = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: social == null
                                  ? Colors.transparent
                                  : social == true
                                      ? Colors.blue
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                'Evet',
                                style: GoogleFonts.indieFlower(
                                    color: social == null
                                        ? Colors.black
                                        : social == true
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Bounceable(
                          onTap: () {
                            setState(() {
                              social = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: social == null
                                  ? Colors.transparent
                                  : social == true
                                      ? Colors.transparent
                                      : Colors.blue,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                'Hayır',
                                style: GoogleFonts.indieFlower(
                                    color: social == null
                                        ? Colors.black
                                        : social == true
                                            ? Colors.black
                                            : Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextMethods().inputBackButton(onTap: () {
                            Navigator.pop(context);
                          }),
                          const SizedBox(
                            width: 70,
                          ),
                          TextMethods().inputNextButton(onTap: () {
                            if (social == null) {
                              Get.snackbar('Bilgilendirme',
                                  'Devam etmek için soruya cevap vermelisiniz');
                            } else {
                              Get.to(
                                () => Input5(
                                  vakit: widget.vakit,
                                  sigara: widget.sigara,
                                  weight: widget.weight,
                                  height: widget.height,
                                  sosyal: social ?? false,
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                MyDesigns()
                    .assetImageBackground(path: 'images/social.png', web: true),
              ],
            )
          ],
        ),
      ),
    );
  }
}
