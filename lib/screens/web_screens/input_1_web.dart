import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_2.dart';

class Input1Web extends StatefulWidget {
  const Input1Web({Key? key}) : super(key: key);

  @override
  State<Input1Web> createState() => _Input1WebState();
}

class _Input1WebState extends State<Input1Web> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'fLogo',
              child: Image.asset(
                'images/logo.png',
                width: 300,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Hero(
                tag: 'yogaToSmoking',
                child: MyDesigns()
                    .assetImageBackground(path: 'images/yoga.png', web: true),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextMethods().headText(
                      text: 'Haftanın kaç günü kendine vakit ayırıyorsun?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SfSlider(
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 0,
                    value: value.toInt(),
                    interval: 1,
                    onChanged: (e) {
                      setState(() {
                        value = e;
                      });
                    },
                    min: 0,
                    max: 7,
                  ),
                  const SizedBox(
                    height: 50,
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
                          Get.to(() => Input2(
                                vakit: value,
                              ));
                        }),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
