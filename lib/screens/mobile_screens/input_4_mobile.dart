import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_5.dart';

class Input4Mobile extends StatefulWidget {
  final double vakit;
  final double sigara;
  final double kilo;
  final double boy;
  const Input4Mobile(
      {Key? key,
      required this.vakit,
      required this.sigara,
      required this.kilo,
      required this.boy})
      : super(key: key);

  @override
  State<Input4Mobile> createState() => _Input4MobileState();
}

class _Input4MobileState extends State<Input4Mobile> {
  bool? social;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyDesigns().assetImageBackground(path: 'images/social.png'),
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextMethods().inputBackButton(onTap: () {
                    Navigator.pop(context);
                  }),
                  const Spacer(),
                  TextMethods().inputNextButton(onTap: () {
                    if (social == null) {
                      Get.snackbar('Bilgilendirme',
                          'Devam etmek için soruya cevap vermelisiniz');
                    } else {
                      Get.to(
                          () => Input5(
                                height: widget.boy,
                                weight: widget.kilo,
                                sigara: widget.sigara,
                                vakit: widget.vakit,
                                sosyal: social ?? false,
                              ),
                          preventDuplicates: false);
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
