import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_4.dart';

class Input3Web extends StatefulWidget {
  final double vakit;
  final double sigara;
  const Input3Web({Key? key, required this.vakit, required this.sigara})
      : super(key: key);

  @override
  State<Input3Web> createState() => _Input3WebState();
}

class _Input3WebState extends State<Input3Web> {
  double heigth = 160;
  double weigth = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'images/logo.png',
            width: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'heightToSocial',
                child: MyDesigns().assetImageBackground(
                  path: 'images/height.png',
                  web: true,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextMethods().headText(text: 'Boy ve kilonuz kaç?'),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextMethods()
                            .headText(text: 'Boy: ${heigth.toInt()}cm'),
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
                        TextMethods()
                            .headText(text: 'Kilo: ${weigth.toInt()}kg'),
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
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
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
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
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
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
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
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
                                Get.to(
                                  () => Input4(
                                    weight: weigth,
                                    height: heigth,
                                    vakit: widget.vakit,
                                    sigara: widget.sigara,
                                  ),
                                );
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
