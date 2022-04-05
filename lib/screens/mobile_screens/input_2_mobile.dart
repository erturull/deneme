import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/screens/input_3.dart';

class Input2Mobile extends StatefulWidget {
  final double vakit;
  const Input2Mobile({Key? key, required this.vakit}) : super(key: key);

  @override
  State<Input2Mobile> createState() => _Input2MobileState();
}

class _Input2MobileState extends State<Input2Mobile> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyDesigns().assetImageBackground(path: 'images/no-smoking.png'),
            TextMethods().headText(
                text: 'Günde kaç sigara içiyorsun?',
                textAlign: TextAlign.center),
            const Spacer(),
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
                    Get.to(() => Input3(vakit: widget.vakit, sigara: value));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
