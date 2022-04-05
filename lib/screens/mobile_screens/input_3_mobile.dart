import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_4.dart';

class Input3Mobile extends StatefulWidget {
  final double vakit;
  final double sigara;
  const Input3Mobile({Key? key, required this.vakit, required this.sigara})
      : super(key: key);

  @override
  State<Input3Mobile> createState() => _Input3MobileState();
}

class _Input3MobileState extends State<Input3Mobile> {
  double heigth = 160;
  double weigth = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyDesigns().assetImageBackground(path: 'images/height.png'),
            TextMethods().headText(text: 'Boy ve kilonuz kaç?'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextMethods().headText(text: 'Boy: ${heigth.toInt()}cm'),
                  SfSlider(
                    value: heigth.toInt(),
                    onChanged: (e) {
                      setState(() {
                        heigth = e;
                      });
                    },
                    min: 50,
                    max: 250,
                  ),
                  const Divider(),
                  TextMethods().headText(text: 'Kilo: ${weigth.toInt()}kg'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Bounceable(
                        onTap: () {
                          setState(() {
                            weigth -= 5;
                          });
                        },
                        child: const CircleAvatar(
                          radius: 32,
                          child: Text(
                            '-5',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                      Bounceable(
                        onTap: () {
                          setState(() {
                            weigth -= 1;
                          });
                        },
                        child: const CircleAvatar(
                          radius: 36,
                          child: Text(
                            '-1',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                      Bounceable(
                        onTap: () {
                          setState(() {
                            weigth += 1;
                          });
                        },
                        child: const CircleAvatar(
                          radius: 36,
                          child: Text(
                            '1+',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                      Bounceable(
                        onTap: () {
                          setState(() {
                            weigth += 5;
                          });
                        },
                        child: const CircleAvatar(
                          radius: 32,
                          child: Text(
                            '5+',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextMethods().inputBackButton(onTap: () {
                    Navigator.pop(context);
                  }),
                  const Spacer(),
                  TextMethods().inputNextButton(onTap: () {
                    Get.to(
                      () => Input4(
                        vakit: widget.vakit,
                        sigara: widget.sigara,
                        weight: weigth,
                        height: heigth,
                      ),
                    );
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
