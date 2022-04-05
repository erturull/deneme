import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_3.dart';

class Input2Web extends StatefulWidget {
  final double vakit;
  const Input2Web({Key? key, required this.vakit}) : super(key: key);

  @override
  State<Input2Web> createState() => _Input2WebState();
}

class _Input2WebState extends State<Input2Web> {
  double value = 0;
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
                    TextMethods().headText(
                        text: 'Günde kaç sigara içiyorsun?',
                        textAlign: TextAlign.center),
                    TextMethods().headText(
                        text: value.toInt() == 0
                            ? "Sigara Kullanmıyorum"
                            : value.toInt() == 60
                                ? "60 taneden fazla"
                                : "${value.toInt()} tane"),
                    SfSlider(
                      value: value.toInt(),
                      interval: 1,
                      onChanged: (e) {
                        setState(() {
                          value = e;
                        });
                      },
                      min: 0,
                      max: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextMethods().inputBackButton(onTap: () {
                            Navigator.pop(context);
                          }),
                          const SizedBox(
                            width: 70,
                          ),
                          TextMethods().inputNextButton(onTap: () {
                            Get.to(() =>
                                Input3(vakit: widget.vakit, sigara: value));
                          })
                        ],
                      ),
                    ),
                  ],
                ),
                Hero(
                  tag: 'yogaToSmoking',
                  child: MyDesigns().assetImageBackground(
                      path: 'images/no-smoking.png', web: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
